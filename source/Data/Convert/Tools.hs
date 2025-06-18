{-# LANGUAGE PatternSynonyms #-}

module Data.Convert.Tools (Unit, pattern Unit, fromTotal, intoTotal, maybeToEither, eitherToMaybe) where

import Data.Void

type Unit = ()

{-# COMPLETE Unit #-}
pattern Unit :: Unit
pattern Unit = ()

fromTotal :: Either Void a -> a
fromTotal = either absurd id

intoTotal :: a -> Either Void a
intoTotal = Right

maybeToEither :: Maybe a -> Either Unit a
maybeToEither = maybe (Left Unit) Right

eitherToMaybe :: Either Unit a -> Maybe a
eitherToMaybe = either (\ Unit -> Nothing) Just
