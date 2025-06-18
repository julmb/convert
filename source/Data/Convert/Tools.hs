{-# LANGUAGE PatternSynonyms #-}

module Data.Convert.Tools (Unit, pattern Unit, fromTotal, intoTotal, fromPartial, intoPartial) where

import Data.Void

type Unit = ()

{-# COMPLETE Unit #-}
pattern Unit :: Unit
pattern Unit = ()

fromTotal :: Either Void a -> a
fromTotal = either absurd id

intoTotal :: a -> Either Void a
intoTotal = Right

fromPartial :: Either Unit a -> Maybe a
fromPartial = either (\ Unit -> Nothing) Just

intoPartial :: Maybe a -> Either Unit a
intoPartial = maybe (Left Unit) Right
