{-# LANGUAGE TypeFamilies #-}

module Data.Convert.Class (maybeToEither, eitherToMaybe, Convert (..), Transform (..), transformSimple, transformThrow) where

import Control.Exception
import GHC.Stack

maybeToEither :: Maybe a -> Either () a
maybeToEither = maybe (Left ()) Right

eitherToMaybe :: Either () a -> Maybe a
eitherToMaybe = either (\ () -> Nothing) Just

class Convert source target where
    convert :: source -> target
class Transform source target where
    type Failure source target
    type Failure source target = ()
    transform :: source -> Either (Failure source target) target

instance Convert (Maybe a) (Either () a) where convert = maybeToEither
instance Convert (Either () a) (Maybe a) where convert = eitherToMaybe

transformSimple :: Failure a b ~ () => Transform a b => a -> Maybe b
transformSimple = eitherToMaybe . transform

transformThrow :: HasCallStack => Exception (Failure a b) => Transform a b => a -> b
transformThrow = either throw id . transform
