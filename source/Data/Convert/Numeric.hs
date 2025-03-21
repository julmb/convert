{-# OPTIONS_GHC -Wno-orphans #-}

module Data.Convert.Numeric () where

import Data.Convert.Class
import Data.Word
import Numeric.Natural
import Data.Int
import Data.Convert.Tools
import Data.Bits

instance Convert Word8 Natural where from = fromIntegral
instance Partial Natural Word8 where fromTry = maybeToEither . toIntegralSized

instance Convert Word16 Natural where from = fromIntegral
instance Partial Natural Word16 where fromTry = maybeToEither . toIntegralSized

instance Convert Word32 Natural where from = fromIntegral
instance Partial Natural Word32 where fromTry = maybeToEither . toIntegralSized

instance Convert Word64 Natural where from = fromIntegral
instance Partial Natural Word64 where fromTry = maybeToEither . toIntegralSized

instance Convert Int Int64 where from = fromIntegral
instance Partial Int64 Int where fromTry = maybeToEither . toIntegralSized

instance Partial Int Word8 where fromTry = maybeToEither . toIntegralSized
instance Partial Word8 Int where fromTry = maybeToEither . toIntegralSized

instance Partial Int Natural where fromTry = maybeToEither . toIntegralSized
instance Partial Natural Int where fromTry = maybeToEither . toIntegralSized

instance Convert Natural Integer where from = fromIntegral
instance Partial Integer Natural where fromTry = maybeToEither . toIntegralSized
