{-# LANGUAGE FunctionalDependencies #-}

module Data.Convert.Class
(
    Convert (..), Partial (..),
    partialError, partialThrow
)
where

import Control.Exception
import GHC.Stack

class Convert a b where convert :: a -> b
class Partial e a b | a b -> e where partial :: a -> Either e b

partialError :: HasCallStack => Partial String a b => a -> b
partialError = either error id . partial

partialThrow :: HasCallStack => Exception e => Partial e a b => a -> b
partialThrow = either throw id . partial
