{-# LANGUAGE NoPolyKinds #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

module Data.Convert.Class
(
    ConvertException (..),
    Convert (..), Partial (..),
    mkEmpty, mkMessage, mkError,
    partialThrow, partialString, partialFail, partialVia
)
where

import Control.Exception
import GHC.Stack
import Type.Reflection
import Text.Printf
import Data.Bifunctor
import Control.Monad
import Data.Coerce

data ConvertException a b = Empty | Message String | forall e. Exception e => Error e

display :: forall a b. Typeable a => Typeable b => ConvertException a b -> String
display = printf "convert from %s to %s: %s" (show $ typeRep @a) (show $ typeRep @b) . go where
    go Empty = "failure"
    go (Message message) = message
    go (Error exception) = displayException exception

deriving instance Show (ConvertException a b)
instance (Typeable a, Typeable b) => Exception (ConvertException a b) where displayException = display

class Convert a b where convert :: a -> b
class Partial a b where partial :: a -> Either (ConvertException a b) b

mkEmpty :: Maybe b -> Either (ConvertException a b) b
mkEmpty = maybe (Left Empty) Right

mkMessage :: Either String b -> Either (ConvertException a b) b
mkMessage = first Message

mkError :: Exception e => Either e b -> Either (ConvertException a b) b
mkError = first Error

partialThrow :: HasCallStack => Typeable a => Typeable b => Partial a b => a -> b
partialThrow = either throw id . partial

partialString :: Typeable a => Typeable b => Partial a b => a -> Either String b
partialString = first display . partial

partialFail :: MonadFail m => Typeable a => Typeable b => Partial a b => a -> m b
partialFail = either fail pure . partialString

partialVia :: forall b a c. Partial a b => Partial b c => a -> Either (ConvertException a c) c
partialVia = f >=> g where
    f = first coerce . partial :: a -> Either (ConvertException a c) b
    g = first coerce . partial :: b -> Either (ConvertException a c) c
