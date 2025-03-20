{-# LANGUAGE TypeFamilies #-}

module Data.Convert.Class (Convert (..), into, Partial (..), intoTry) where

import Data.Kind

class Convert a b where from :: a -> b

into :: forall b a. Convert a b => a -> b
into = from

class Partial a b where
    type Fail a b :: Type
    type Fail a b = ()
    fromTry :: a -> Either (Fail a b) b

intoTry :: forall b a. Partial a b => a -> Either (Fail a b) b
intoTry = fromTry
