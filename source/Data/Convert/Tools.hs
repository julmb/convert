module Data.Convert.Tools (maybeToEither, eitherToMaybe, maybeToEitherMessage) where

import Type.Reflection
import Text.Printf

maybeToEither :: Maybe a -> Either () a
maybeToEither = maybe (Left ()) Right

eitherToMaybe :: Either () a -> Maybe a
eitherToMaybe = either (\ () -> Nothing) Just

maybeToEitherMessage :: forall a b. Typeable a => Typeable b => Show a => (a -> Maybe b) -> (a -> Either String b)
maybeToEitherMessage f a = maybe (Left message) Right $ f a where
    message = printf "could not convert %s from %s to %s" (show a) (show $ typeRep @a) (show $ typeRep @b)
