{-# LANGUAGE PatternSynonyms #-}

module Data.Convert.Tools (Unit, pattern Unit, maybeToEither, eitherToMaybe) where

type Unit = ()

{-# COMPLETE Unit #-}
pattern Unit :: Unit
pattern Unit = ()

maybeToEither :: Maybe a -> Either Unit a
maybeToEither = maybe (Left Unit) Right

eitherToMaybe :: Either Unit a -> Maybe a
eitherToMaybe = either (\ Unit -> Nothing) Just
