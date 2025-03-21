{-# LANGUAGE FunctionalDependencies #-}

module Data.Convert.Class (Convert (..), into, Partial (..), intoTry) where

class Convert a b where from :: a -> b

into :: forall b a. Convert a b => a -> b
into = from

class Partial a b c | a b -> c where fromTry :: a -> Either c b

intoTry :: forall b a c. Partial a b c => a -> Either c b
intoTry = fromTry
