{-# OPTIONS_GHC -Wno-orphans #-}

module Data.Convert.Numeric () where

import Data.Void
import Data.Bits
import Data.Word
import Data.Int
import Data.Convert.Tools
import Data.Convert.Class
import Numeric.Natural

instance Convert Word8 Word16 Void where convert = Right . fromIntegral
instance Convert Word8 Word32 Void where convert = Right . fromIntegral
instance Convert Word8 Word64 Void where convert = Right . fromIntegral
instance Convert Word8 Word Void where convert = Right . fromIntegral
instance Convert Word8 Natural Void where convert = Right . fromIntegral
instance Convert Word8 Int8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word8 Int16 Void where convert = Right . fromIntegral
instance Convert Word8 Int32 Void where convert = Right . fromIntegral
instance Convert Word8 Int64 Void where convert = Right . fromIntegral
instance Convert Word8 Int Void where convert = Right . fromIntegral
instance Convert Word8 Integer Void where convert = Right . fromIntegral

instance Convert Word16 Word8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word16 Word32 Void where convert = Right . fromIntegral
instance Convert Word16 Word64 Void where convert = Right . fromIntegral
instance Convert Word16 Word Void where convert = Right . fromIntegral
instance Convert Word16 Natural Void where convert = Right . fromIntegral
instance Convert Word16 Int8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word16 Int16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word16 Int32 Void where convert = Right . fromIntegral
instance Convert Word16 Int64 Void where convert = Right . fromIntegral
instance Convert Word16 Int Void where convert = Right . fromIntegral
instance Convert Word16 Integer Void where convert = Right . fromIntegral

instance Convert Word32 Word8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word32 Word16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word32 Word64 Void where convert = Right . fromIntegral
instance Convert Word32 Word Void where convert = Right . fromIntegral
instance Convert Word32 Natural Void where convert = Right . fromIntegral
instance Convert Word32 Int8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word32 Int16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word32 Int32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word32 Int64 Void where convert = Right . fromIntegral
instance Convert Word32 Int Void where convert = Right . fromIntegral
instance Convert Word32 Integer Void where convert = Right . fromIntegral

instance Convert Word64 Word8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word64 Word16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word64 Word32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word64 Word Void where convert = Right . fromIntegral
instance Convert Word64 Natural Void where convert = Right . fromIntegral
instance Convert Word64 Int8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word64 Int16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word64 Int32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word64 Int64 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word64 Int Unit where convert = maybeToEither . toIntegralSized
instance Convert Word64 Integer Void where convert = Right . fromIntegral

instance Convert Word Word8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word Word16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word Word32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word Word64 Void where convert = Right . fromIntegral
instance Convert Word Natural Void where convert = Right . fromIntegral
instance Convert Word Int8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word Int16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word Int32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word Int64 Unit where convert = maybeToEither . toIntegralSized
instance Convert Word Int Unit where convert = maybeToEither . toIntegralSized
instance Convert Word Integer Void where convert = Right . fromIntegral

instance Convert Natural Word8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Natural Word16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Natural Word32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Natural Word64 Unit where convert = maybeToEither . toIntegralSized
instance Convert Natural Word Unit where convert = maybeToEither . toIntegralSized
instance Convert Natural Int8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Natural Int16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Natural Int32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Natural Int64 Unit where convert = maybeToEither . toIntegralSized
instance Convert Natural Int Unit where convert = maybeToEither . toIntegralSized
instance Convert Natural Integer Void where convert = Right . fromIntegral

instance Convert Int8 Word8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int8 Word16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int8 Word32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int8 Word64 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int8 Word Unit where convert = maybeToEither . toIntegralSized
instance Convert Int8 Natural Unit where convert = maybeToEither . toIntegralSized
instance Convert Int8 Int16 Void where convert = Right . fromIntegral
instance Convert Int8 Int32 Void where convert = Right . fromIntegral
instance Convert Int8 Int64 Void where convert = Right . fromIntegral
instance Convert Int8 Int Void where convert = Right . fromIntegral
instance Convert Int8 Integer Void where convert = Right . fromIntegral

instance Convert Int16 Word8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int16 Word16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int16 Word32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int16 Word64 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int16 Word Unit where convert = maybeToEither . toIntegralSized
instance Convert Int16 Natural Unit where convert = maybeToEither . toIntegralSized
instance Convert Int16 Int8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int16 Int32 Void where convert = Right . fromIntegral
instance Convert Int16 Int64 Void where convert = Right . fromIntegral
instance Convert Int16 Int Void where convert = Right . fromIntegral
instance Convert Int16 Integer Void where convert = Right . fromIntegral

instance Convert Int32 Word8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int32 Word16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int32 Word32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int32 Word64 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int32 Word Unit where convert = maybeToEither . toIntegralSized
instance Convert Int32 Natural Unit where convert = maybeToEither . toIntegralSized
instance Convert Int32 Int8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int32 Int16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int32 Int64 Void where convert = Right . fromIntegral
instance Convert Int32 Int Void where convert = Right . fromIntegral
instance Convert Int32 Integer Void where convert = Right . fromIntegral

instance Convert Int64 Word8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int64 Word16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int64 Word32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int64 Word64 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int64 Word Unit where convert = maybeToEither . toIntegralSized
instance Convert Int64 Natural Unit where convert = maybeToEither . toIntegralSized
instance Convert Int64 Int8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int64 Int16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int64 Int32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int64 Int Void where convert = Right . fromIntegral
instance Convert Int64 Integer Void where convert = Right . fromIntegral

instance Convert Int Word8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int Word16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int Word32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int Word64 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int Word Unit where convert = maybeToEither . toIntegralSized
instance Convert Int Natural Unit where convert = maybeToEither . toIntegralSized
instance Convert Int Int8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int Int16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int Int32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Int Int64 Void where convert = Right . fromIntegral
instance Convert Int Integer Void where convert = Right . fromIntegral

instance Convert Integer Word8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Integer Word16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Integer Word32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Integer Word64 Unit where convert = maybeToEither . toIntegralSized
instance Convert Integer Word Unit where convert = maybeToEither . toIntegralSized
instance Convert Integer Natural Unit where convert = maybeToEither . toIntegralSized
instance Convert Integer Int8 Unit where convert = maybeToEither . toIntegralSized
instance Convert Integer Int16 Unit where convert = maybeToEither . toIntegralSized
instance Convert Integer Int32 Unit where convert = maybeToEither . toIntegralSized
instance Convert Integer Int64 Unit where convert = maybeToEither . toIntegralSized
instance Convert Integer Int Unit where convert = maybeToEither . toIntegralSized
