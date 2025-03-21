{-# OPTIONS_GHC -Wno-orphans #-}

module Data.Convert.Numeric () where

import Data.Bits
import Data.Word
import Data.Int
import Data.Convert.Tools
import Data.Convert.Class
import Numeric.Natural

instance Convert Word8 Word16 where from = fromIntegral
instance Convert Word8 Word32 where from = fromIntegral
instance Convert Word8 Word64 where from = fromIntegral
instance Convert Word8 Word where from = fromIntegral
instance Convert Word8 Natural where from = fromIntegral
instance Partial Word8 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word8 Int16 where from = fromIntegral
instance Convert Word8 Int32 where from = fromIntegral
instance Convert Word8 Int64 where from = fromIntegral
instance Convert Word8 Int where from = fromIntegral
instance Convert Word8 Integer where from = fromIntegral

instance Partial Word16 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word16 Word32 where from = fromIntegral
instance Convert Word16 Word64 where from = fromIntegral
instance Convert Word16 Word where from = fromIntegral
instance Convert Word16 Natural where from = fromIntegral
instance Partial Word16 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word16 Int16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word16 Int32 where from = fromIntegral
instance Convert Word16 Int64 where from = fromIntegral
instance Convert Word16 Int where from = fromIntegral
instance Convert Word16 Integer where from = fromIntegral

instance Partial Word32 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word32 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word32 Word64 where from = fromIntegral
instance Convert Word32 Word where from = fromIntegral
instance Convert Word32 Natural where from = fromIntegral
instance Partial Word32 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word32 Int16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word32 Int32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word32 Int64 where from = fromIntegral
instance Convert Word32 Int where from = fromIntegral
instance Convert Word32 Integer where from = fromIntegral

instance Partial Word64 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word64 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word64 Word32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word64 Word where from = fromIntegral
instance Convert Word64 Natural where from = fromIntegral
instance Partial Word64 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word64 Int16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word64 Int32 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word64 Int64 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word64 Int () where fromTry = maybeToEither . toIntegralSized
instance Convert Word64 Integer where from = fromIntegral

instance Partial Word Word8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word Word16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word Word32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word Word64 where from = fromIntegral
instance Convert Word Natural where from = fromIntegral
instance Partial Word Int8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word Int16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word Int32 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word Int64 () where fromTry = maybeToEither . toIntegralSized
instance Partial Word Int () where fromTry = maybeToEither . toIntegralSized
instance Convert Word Integer where from = fromIntegral

instance Partial Natural Word8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Natural Word16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Natural Word32 () where fromTry = maybeToEither . toIntegralSized
instance Partial Natural Word64 () where fromTry = maybeToEither . toIntegralSized
instance Partial Natural Word () where fromTry = maybeToEither . toIntegralSized
instance Partial Natural Int8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Natural Int16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Natural Int32 () where fromTry = maybeToEither . toIntegralSized
instance Partial Natural Int64 () where fromTry = maybeToEither . toIntegralSized
instance Partial Natural Int () where fromTry = maybeToEither . toIntegralSized
instance Convert Natural Integer where from = fromIntegral

instance Partial Int8 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int8 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int8 Word32 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int8 Word64 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int8 Word () where fromTry = maybeToEither . toIntegralSized
instance Partial Int8 Natural () where fromTry = maybeToEither . toIntegralSized
instance Convert Int8 Int16 where from = fromIntegral
instance Convert Int8 Int32 where from = fromIntegral
instance Convert Int8 Int64 where from = fromIntegral
instance Convert Int8 Int where from = fromIntegral
instance Convert Int8 Integer where from = fromIntegral

instance Partial Int16 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int16 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int16 Word32 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int16 Word64 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int16 Word () where fromTry = maybeToEither . toIntegralSized
instance Partial Int16 Natural () where fromTry = maybeToEither . toIntegralSized
instance Partial Int16 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int16 Int32 where from = fromIntegral
instance Convert Int16 Int64 where from = fromIntegral
instance Convert Int16 Int where from = fromIntegral
instance Convert Int16 Integer where from = fromIntegral

instance Partial Int32 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int32 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int32 Word32 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int32 Word64 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int32 Word () where fromTry = maybeToEither . toIntegralSized
instance Partial Int32 Natural () where fromTry = maybeToEither . toIntegralSized
instance Partial Int32 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int32 Int16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int32 Int64 where from = fromIntegral
instance Convert Int32 Int where from = fromIntegral
instance Convert Int32 Integer where from = fromIntegral

instance Partial Int64 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int64 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int64 Word32 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int64 Word64 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int64 Word () where fromTry = maybeToEither . toIntegralSized
instance Partial Int64 Natural () where fromTry = maybeToEither . toIntegralSized
instance Partial Int64 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int64 Int16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int64 Int32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int64 Int where from = fromIntegral
instance Convert Int64 Integer where from = fromIntegral

instance Partial Int Word8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int Word16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int Word32 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int Word64 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int Word () where fromTry = maybeToEither . toIntegralSized
instance Partial Int Natural () where fromTry = maybeToEither . toIntegralSized
instance Partial Int Int8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int Int16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Int Int32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int Int64 where from = fromIntegral
instance Convert Int Integer where from = fromIntegral

instance Partial Integer Word8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Integer Word16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Integer Word32 () where fromTry = maybeToEither . toIntegralSized
instance Partial Integer Word64 () where fromTry = maybeToEither . toIntegralSized
instance Partial Integer Word () where fromTry = maybeToEither . toIntegralSized
instance Partial Integer Natural () where fromTry = maybeToEither . toIntegralSized
instance Partial Integer Int8 () where fromTry = maybeToEither . toIntegralSized
instance Partial Integer Int16 () where fromTry = maybeToEither . toIntegralSized
instance Partial Integer Int32 () where fromTry = maybeToEither . toIntegralSized
instance Partial Integer Int64 () where fromTry = maybeToEither . toIntegralSized
instance Partial Integer Int () where fromTry = maybeToEither . toIntegralSized
