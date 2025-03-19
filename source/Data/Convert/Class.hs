{-# LANGUAGE FunctionalDependencies #-}

module Data.Convert.Class
(
    Convert (..), Partial (..), into,
    partialUndefined, partialError, partialThrow, partialMaybe, partialString, partialDisplay
)
where

import Control.Exception
import Data.Bifunctor
import Data.Convert.Tools
import GHC.Stack

class Convert a b where convert :: a -> b
class Partial e a b | a b -> e where partial :: a -> Either e b

into :: forall b a. Convert a b => a -> b
into = convert

partialUndefined :: HasCallStack => Partial () a b => a -> b
partialUndefined = either undefined id . partial

partialError :: HasCallStack => Partial String a b => a -> b
partialError = either error id . partial

partialThrow :: HasCallStack => Exception e => Partial e a b => a -> b
partialThrow = either throw id . partial

partialMaybe :: Partial () a b => a -> Maybe b
partialMaybe = eitherToMaybe . partial

partialString :: Partial String a b => a -> Either String b
partialString = partial

partialDisplay :: Exception e => Partial e a b => a -> Either String b
partialDisplay = first displayException . partial
