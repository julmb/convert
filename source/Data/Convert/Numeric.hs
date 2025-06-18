{-# OPTIONS_GHC -Wno-orphans #-}

module Data.Convert.Numeric () where

import Data.Void
import Data.Bits
import Data.Word
import Data.Int
import Data.Convert.Tools
import Data.Convert.Class
import Numeric.Natural

instance Convert Word8 Word16 Void where fromTry = Right . fromIntegral
instance Convert Word8 Word32 Void where fromTry = Right . fromIntegral
instance Convert Word8 Word64 Void where fromTry = Right . fromIntegral
instance Convert Word8 Word Void where fromTry = Right . fromIntegral
instance Convert Word8 Natural Void where fromTry = Right . fromIntegral
instance Convert Word8 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word8 Int16 Void where fromTry = Right . fromIntegral
instance Convert Word8 Int32 Void where fromTry = Right . fromIntegral
instance Convert Word8 Int64 Void where fromTry = Right . fromIntegral
instance Convert Word8 Int Void where fromTry = Right . fromIntegral
instance Convert Word8 Integer Void where fromTry = Right . fromIntegral

instance Convert Word16 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word16 Word32 Void where fromTry = Right . fromIntegral
instance Convert Word16 Word64 Void where fromTry = Right . fromIntegral
instance Convert Word16 Word Void where fromTry = Right . fromIntegral
instance Convert Word16 Natural Void where fromTry = Right . fromIntegral
instance Convert Word16 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word16 Int16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word16 Int32 Void where fromTry = Right . fromIntegral
instance Convert Word16 Int64 Void where fromTry = Right . fromIntegral
instance Convert Word16 Int Void where fromTry = Right . fromIntegral
instance Convert Word16 Integer Void where fromTry = Right . fromIntegral

instance Convert Word32 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word32 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word32 Word64 Void where fromTry = Right . fromIntegral
instance Convert Word32 Word Void where fromTry = Right . fromIntegral
instance Convert Word32 Natural Void where fromTry = Right . fromIntegral
instance Convert Word32 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word32 Int16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word32 Int32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word32 Int64 Void where fromTry = Right . fromIntegral
instance Convert Word32 Int Void where fromTry = Right . fromIntegral
instance Convert Word32 Integer Void where fromTry = Right . fromIntegral

instance Convert Word64 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word64 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word64 Word32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word64 Word Void where fromTry = Right . fromIntegral
instance Convert Word64 Natural Void where fromTry = Right . fromIntegral
instance Convert Word64 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word64 Int16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word64 Int32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word64 Int64 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word64 Int () where fromTry = maybeToEither . toIntegralSized
instance Convert Word64 Integer Void where fromTry = Right . fromIntegral

instance Convert Word Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word Word16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word Word32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word Word64 Void where fromTry = Right . fromIntegral
instance Convert Word Natural Void where fromTry = Right . fromIntegral
instance Convert Word Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word Int16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word Int32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word Int64 () where fromTry = maybeToEither . toIntegralSized
instance Convert Word Int () where fromTry = maybeToEither . toIntegralSized
instance Convert Word Integer Void where fromTry = Right . fromIntegral

instance Convert Natural Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Natural Word16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Natural Word32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Natural Word64 () where fromTry = maybeToEither . toIntegralSized
instance Convert Natural Word () where fromTry = maybeToEither . toIntegralSized
instance Convert Natural Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Natural Int16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Natural Int32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Natural Int64 () where fromTry = maybeToEither . toIntegralSized
instance Convert Natural Int () where fromTry = maybeToEither . toIntegralSized
instance Convert Natural Integer Void where fromTry = Right . fromIntegral

instance Convert Int8 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int8 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int8 Word32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int8 Word64 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int8 Word () where fromTry = maybeToEither . toIntegralSized
instance Convert Int8 Natural () where fromTry = maybeToEither . toIntegralSized
instance Convert Int8 Int16 Void where fromTry = Right . fromIntegral
instance Convert Int8 Int32 Void where fromTry = Right . fromIntegral
instance Convert Int8 Int64 Void where fromTry = Right . fromIntegral
instance Convert Int8 Int Void where fromTry = Right . fromIntegral
instance Convert Int8 Integer Void where fromTry = Right . fromIntegral

instance Convert Int16 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int16 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int16 Word32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int16 Word64 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int16 Word () where fromTry = maybeToEither . toIntegralSized
instance Convert Int16 Natural () where fromTry = maybeToEither . toIntegralSized
instance Convert Int16 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int16 Int32 Void where fromTry = Right . fromIntegral
instance Convert Int16 Int64 Void where fromTry = Right . fromIntegral
instance Convert Int16 Int Void where fromTry = Right . fromIntegral
instance Convert Int16 Integer Void where fromTry = Right . fromIntegral

instance Convert Int32 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int32 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int32 Word32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int32 Word64 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int32 Word () where fromTry = maybeToEither . toIntegralSized
instance Convert Int32 Natural () where fromTry = maybeToEither . toIntegralSized
instance Convert Int32 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int32 Int16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int32 Int64 Void where fromTry = Right . fromIntegral
instance Convert Int32 Int Void where fromTry = Right . fromIntegral
instance Convert Int32 Integer Void where fromTry = Right . fromIntegral

instance Convert Int64 Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int64 Word16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int64 Word32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int64 Word64 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int64 Word () where fromTry = maybeToEither . toIntegralSized
instance Convert Int64 Natural () where fromTry = maybeToEither . toIntegralSized
instance Convert Int64 Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int64 Int16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int64 Int32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int64 Int Void where fromTry = Right . fromIntegral
instance Convert Int64 Integer Void where fromTry = Right . fromIntegral

instance Convert Int Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int Word16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int Word32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int Word64 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int Word () where fromTry = maybeToEither . toIntegralSized
instance Convert Int Natural () where fromTry = maybeToEither . toIntegralSized
instance Convert Int Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int Int16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int Int32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Int Int64 Void where fromTry = Right . fromIntegral
instance Convert Int Integer Void where fromTry = Right . fromIntegral

instance Convert Integer Word8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Integer Word16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Integer Word32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Integer Word64 () where fromTry = maybeToEither . toIntegralSized
instance Convert Integer Word () where fromTry = maybeToEither . toIntegralSized
instance Convert Integer Natural () where fromTry = maybeToEither . toIntegralSized
instance Convert Integer Int8 () where fromTry = maybeToEither . toIntegralSized
instance Convert Integer Int16 () where fromTry = maybeToEither . toIntegralSized
instance Convert Integer Int32 () where fromTry = maybeToEither . toIntegralSized
instance Convert Integer Int64 () where fromTry = maybeToEither . toIntegralSized
instance Convert Integer Int () where fromTry = maybeToEither . toIntegralSized
