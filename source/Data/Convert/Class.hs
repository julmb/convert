{-# LANGUAGE TypeFamilies #-}

module Data.Convert.Class (Convert (..), Transform (..), transformSimple, transformThrow, transformDisplay) where

import Control.Exception
import Data.Bifunctor
import GHC.Stack
import Data.Convert.Tools

class Convert a b where
    convert :: a -> b
class Transform a b where
    type Failure a b
    type Failure a b = ()
    transform :: a -> Either (Failure a b) b

transformSimple :: Failure a b ~ () => Transform a b => a -> Maybe b
transformSimple = eitherToMaybe . transform

transformThrow :: HasCallStack => Exception (Failure a b) => Transform a b => a -> b
transformThrow = either throw id . transform

transformDisplay :: Exception (Failure a b) => Transform a b => a -> Either String b
transformDisplay = first displayException . transform
