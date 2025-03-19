{-# LANGUAGE TypeFamilies #-}

module Data.Convert.Class (Convert (..), Partial (..), partialThrow, partialMaybe, partialDisplay) where

import Control.Exception
import Data.Bifunctor
import Data.Convert.Tools
import GHC.Stack

class Convert a b where
    convert :: a -> b
class Partial a b where
    type Failure a b
    type Failure a b = ()
    partial :: a -> Either (Failure a b) b

partialThrow :: HasCallStack => Exception (Failure a b) => Partial a b => a -> b
partialThrow = either throw id . partial

partialMaybe :: Failure a b ~ () => Partial a b => a -> Maybe b
partialMaybe = eitherToMaybe . partial

partialDisplay :: Exception (Failure a b) => Partial a b => a -> Either String b
partialDisplay = first displayException . partial
