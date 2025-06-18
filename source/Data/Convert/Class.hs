{-# LANGUAGE FunctionalDependencies #-}

module Data.Convert.Class (Convert (..), intoTry, from, into) where

import Data.Void

class Convert a b c | a b -> c where fromTry :: a -> Either c b

intoTry :: forall b a c. Convert a b c => a -> Either c b
intoTry = fromTry

from :: Convert a b Void => a -> b
from = either absurd id . fromTry

into :: forall b a. Convert a b Void => a -> b
into = from
