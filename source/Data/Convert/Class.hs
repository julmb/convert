{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE NoPolyKinds #-}
{-# LANGUAGE UndecidableInstances #-}

module Data.Convert.Class
(
    Convert (..), fromTry, intoTry, from, into, fromMaybe, intoMaybe,
    Display (..), ConvertException (..), fromWrap, fromThrow, fromShow, fromFail
)
where

import Type.Reflection
import Control.Exception
import Data.Void
import Data.Bifunctor
import Data.Convert.Tools
import Text.Printf
import GHC.Stack

class Convert e a b | a b -> e where convert :: a -> Either e b

fromTry :: forall a b e. Convert e a b => a -> Either e b
fromTry = convert

intoTry :: forall b a e. Convert e a b => a -> Either e b
intoTry = convert

from :: forall a b. Convert Void a b => a -> b
from = either absurd id . convert

into :: forall b a. Convert Void a b => a -> b
into = either absurd id . convert

fromMaybe :: forall a b. Convert Unit a b => a -> Maybe b
fromMaybe = eitherToMaybe . convert

intoMaybe :: forall b a. Convert Unit a b => a -> Maybe b
intoMaybe = eitherToMaybe . convert

class Display a where display :: a -> Maybe String

instance Display Unit where display Unit = Nothing
instance Display String where display = Just
instance {-# OVERLAPPABLE #-} Exception e => Display e where display = Just . displayException

newtype ConvertException a b e = ConvertException { content :: e }

instance (Typeable a, Typeable b, Display e) => Show (ConvertException a b e) where
    show = compose . display . content where
        compose = maybe base $ printf "%s: %s" base
        base = printf "could not convert from %s to %s" (show $ typeRep @a) (show $ typeRep @b)
instance (Typeable a, Typeable b, Typeable e, Display e) => Exception (ConvertException a b e)

fromWrap :: forall a b e. Convert e a b => a -> Either (ConvertException a b e) b
fromWrap = first ConvertException . convert

fromThrow :: forall a b e. HasCallStack => Typeable e => Display e => Typeable a => Typeable b => Convert e a b => a -> b
fromThrow = either throw id . fromWrap

fromShow :: forall a b e. Display e => Typeable a => Typeable b => Convert e a b => a -> Either String b
fromShow = first show . fromWrap

fromFail :: forall m a b e. Display e => Typeable a => Typeable b => Convert e a b => MonadFail m => a -> m b
fromFail = either fail pure . fromShow
