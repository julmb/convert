{-# LANGUAGE FunctionalDependencies #-}

module Data.Convert.Class (Partial (..), intoTry, from, into) where

import Data.Void

class Partial a b c | a b -> c where fromTry :: a -> Either c b

intoTry :: forall b a c. Partial a b c => a -> Either c b
intoTry = fromTry

from :: Partial a b Void => a -> b
from = either absurd id . fromTry

into :: forall b a. Partial a b Void => a -> b
into = from
