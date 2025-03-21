{-# LANGUAGE NoPolyKinds #-}
{-# LANGUAGE UndecidableInstances #-}

module Data.Convert.Consume (Display (..), ConvertException (..), fromWrap, fromThrow, fromMaybe, fromShow, fromFail) where

import Type.Reflection
import Control.Exception
import Data.Bifunctor
import Data.Convert.Tools
import Data.Convert.Class
import Text.Printf
import GHC.Stack

class Display a where display :: a -> Maybe String

instance Display () where display () = Nothing
instance Display String where display = Just
instance {-# OVERLAPPABLE #-} Exception e => Display e where display = Just . displayException

newtype ConvertException a b c = ConvertException { content :: c }

instance (Typeable a, Typeable b, Display c) => Show (ConvertException a b c) where
    show = compose . display . content where
        compose = maybe base $ printf "%s: %s" base
        base = printf "could not convert from %s to %s" (show $ typeRep @a) (show $ typeRep @b)
instance (Typeable a, Typeable b, Typeable c, Display c) => Exception (ConvertException a b c)

fromWrap :: Partial a b c => a -> Either (ConvertException a b c) b
fromWrap = first ConvertException . fromTry

fromThrow :: HasCallStack => Typeable a => Typeable b => Typeable c => Display c => Partial a b c => a -> b
fromThrow = either throw id . fromWrap

fromMaybe :: Partial a b () => a -> Maybe b
fromMaybe = eitherToMaybe . fromTry

fromShow :: Typeable a => Typeable b => Display c => Partial a b c => a -> Either String b
fromShow = first show . fromWrap

fromFail :: MonadFail m => Typeable a => Typeable b => Display c => Partial a b c => a -> m b
fromFail = either fail pure . fromShow
