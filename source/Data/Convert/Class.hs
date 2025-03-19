{-# LANGUAGE TypeFamilies #-}

module Data.Convert.Class (Convert (..), Transform (..), transformSimple, transformThrow, transformDisplay) where

import Control.Exception
import Data.Bifunctor
import GHC.Stack
import Data.Convert.Tools

class Convert source target where
    convert :: source -> target
class Transform source target where
    type Failure source target
    type Failure source target = ()
    transform :: source -> Either (Failure source target) target

transformSimple :: Failure a b ~ () => Transform a b => a -> Maybe b
transformSimple = eitherToMaybe . transform

transformThrow :: HasCallStack => Exception (Failure a b) => Transform a b => a -> b
transformThrow = either throw id . transform

transformDisplay :: Exception (Failure a b) => Transform a b => a -> Either String b
transformDisplay = first displayException . transform
