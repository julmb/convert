{-# LANGUAGE FunctionalDependencies #-}

module Data.Convert.Class
(
    Convert (..), Partial (..), into,
    partialError, partialThrow
)
where

import Control.Exception
import GHC.Stack

class Convert a b where convert :: a -> b
class Partial e a b | a b -> e where partial :: a -> Either e b

into :: forall b a. Convert a b => a -> b
into = convert

-- TODO: we do not really care about what type the error value is, we just want to throw it

partialError :: HasCallStack => Partial String a b => a -> b
partialError = either error id . partial

partialThrow :: HasCallStack => Exception e => Partial e a b => a -> b
partialThrow = either throw id . partial
