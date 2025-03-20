{-# LANGUAGE NoPolyKinds #-}
{-# LANGUAGE TypeFamilies #-}

module Data.Convert.Class
(
    ConvertException (..),
    Convert (..), Partial (..),
    partialThrow, partialString, partialFail
)
where

import Control.Exception
import GHC.Stack
import Type.Reflection
import Text.Printf
import Data.Bifunctor
import Data.Kind

class Convert a b where convert :: a -> b
class Partial a b where
    type Fail a b :: Type
    type Fail a b = ()
    partial :: a -> Either (Fail a b) b

-- exceptions

-- TODO: add Display type class and require on content for exception building

newtype ConvertException a b c = ConvertException { content :: c } deriving Show

type Track a b c = (Typeable a, Typeable b, Typeable c, Show c)

instance Track a b c => Exception (ConvertException a b c) where
    displayException = printf "convert from %s to %s: %s" (show $ typeRep @a) (show $ typeRep @b) . show . content

partialWrap :: Partial a b => a -> Either (ConvertException a b (Fail a b)) b
partialWrap = first ConvertException . partial

partialThrow :: HasCallStack => Track a b (Fail a b) => Partial a b => a -> b
partialThrow = either throw id . partialWrap

partialString :: Track a b (Fail a b) => Partial a b => a -> Either String b
partialString = first displayException . partialWrap

partialFail :: MonadFail m => Track a b (Fail a b) => Partial a b => a -> m b
partialFail = either fail pure . partialString
