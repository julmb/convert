module Data.Convert.Tools (maybeToEither, eitherToMaybe) where

maybeToEither :: Maybe a -> Either () a
maybeToEither = maybe (Left ()) Right

eitherToMaybe :: Either () a -> Maybe a
eitherToMaybe = either (\ () -> Nothing) Just
