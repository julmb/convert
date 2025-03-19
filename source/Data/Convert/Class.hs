{-# LANGUAGE TypeFamilies #-}

module Data.Convert.Class
(
    Convert (..), Partial (..), into,
    partialUndefined, partialError, partialThrow, partialMaybe, partialString, partialDisplay
)
where

import Control.Exception
import Data.Kind
import Data.Bifunctor
import Data.Convert.Tools
import GHC.Stack

class Convert a b where
    convert :: a -> b
-- TODO: instead of indexed family, use additional type parameter
class Partial a b where
    type Failure a b :: Type
    type Failure a b = ()
    partial :: a -> Either (Failure a b) b

into :: forall b a. Convert a b => a -> b
into = convert

partialUndefined :: HasCallStack => Failure a b ~ () => Partial a b => a -> b
partialUndefined = either undefined id . partial

partialError :: HasCallStack => Failure a b ~ String => Partial a b => a -> b
partialError = either error id . partial

partialThrow :: HasCallStack => Exception (Failure a b) => Partial a b => a -> b
partialThrow = either throw id . partial

partialMaybe :: Failure a b ~ () => Partial a b => a -> Maybe b
partialMaybe = eitherToMaybe . partial

partialString :: Failure a b ~ String => Partial a b => a -> Either String b
partialString = partial

partialDisplay :: Exception (Failure a b) => Partial a b => a -> Either String b
partialDisplay = first displayException . partial
