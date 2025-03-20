{-# LANGUAGE NoPolyKinds #-}
{-# LANGUAGE TypeFamilies #-}

module Data.Convert.Class
(
    Convert (..), into,
    Partial (..), intoTry,
    ConvertException (..), fromWrap, fromThrow, fromShow, fromFail
)
where

import Control.Exception
import GHC.Stack
import Type.Reflection
import Text.Printf
import Data.Bifunctor
import Data.Kind

class Convert a b where from :: a -> b

into :: forall b a. Convert a b => a -> b
into = from

class Partial a b where
    type Fail a b :: Type
    type Fail a b = ()
    fromTry :: a -> Either (Fail a b) b

intoTry :: forall b a. Partial a b => a -> Either (Fail a b) b
intoTry = fromTry

-- exceptions

-- TODO: add Display type class and require on content for exception building

newtype ConvertException a b c = ConvertException { content :: c } deriving Show

type Track a b c = (Typeable a, Typeable b, Typeable c, Show c)

instance Track a b c => Exception (ConvertException a b c) where
    displayException = printf "convert from %s to %s: %s" (show $ typeRep @a) (show $ typeRep @b) . show . content

fromWrap :: Partial a b => a -> Either (ConvertException a b (Fail a b)) b
fromWrap = first ConvertException . fromTry

fromThrow :: HasCallStack => Track a b (Fail a b) => Partial a b => a -> b
fromThrow = either throw id . fromWrap

fromShow :: Track a b (Fail a b) => Partial a b => a -> Either String b
fromShow = first displayException . fromWrap

fromFail :: MonadFail m => Track a b (Fail a b) => Partial a b => a -> m b
fromFail = either fail pure . fromShow
