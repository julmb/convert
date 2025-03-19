{-# LANGUAGE DeriveAnyClass #-}

module Data.Convert.Class
(
    ConvertException (..), Convert (..), Transform (..),
    transformThrow, transformShow,
    resultNone, resultFail, resultError
)
where

import Control.Exception
import Data.Bifunctor
import GHC.Stack

data ConvertException = None | Fail String | forall e. Exception e => Error e

deriving instance Show ConvertException
deriving instance Exception ConvertException

-- TODO: Maybe we want Transform to have a type family that specifies the left either type?
class Convert source target where convert :: source -> target
class Transform source target where transform :: source -> Either ConvertException target

transformThrow :: HasCallStack => Transform source target => source -> target
transformThrow = either throw id . transform

transformShow :: Transform source target => source -> Either String target
transformShow = first show . transform

resultNone :: Maybe a -> Either ConvertException a
resultNone = maybe (Left None) Right

resultFail :: Either String a -> Either ConvertException a
resultFail = first Fail

resultError :: Exception e => Either e a -> Either ConvertException a
resultError = first Error
