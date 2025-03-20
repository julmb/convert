{-# LANGUAGE NoPolyKinds #-}
{-# LANGUAGE UndecidableInstances #-}

module Data.Convert.Consume (Display (..), ConvertException (..), fromWrap, fromThrow, fromShow, fromFail) where

import Type.Reflection
import Control.Exception
import Data.Convert.Class
import GHC.Stack
import Data.Bifunctor
import Text.Printf

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

fromWrap :: Partial a b => a -> Either (ConvertException a b (Fail a b)) b
fromWrap = first ConvertException . fromTry

fromThrow :: HasCallStack => Typeable a => Typeable b => Typeable (Fail a b) => Display (Fail a b) => Partial a b => a -> b
fromThrow = either throw id . fromWrap

fromShow :: Typeable a => Typeable b => Display (Fail a b) => Partial a b => a -> Either String b
fromShow = first show . fromWrap

fromFail :: MonadFail m => Typeable a => Typeable b => Display (Fail a b) => Partial a b => a -> m b
fromFail = either fail pure . fromShow
