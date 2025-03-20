{-# LANGUAGE NoPolyKinds #-}

module Data.Convert.Consume (ConvertException (..), fromWrap, fromThrow, fromShow, fromFail) where

import Type.Reflection
import Control.Exception
import Data.Convert.Class
import GHC.Stack
import Data.Bifunctor
import Text.Printf

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
