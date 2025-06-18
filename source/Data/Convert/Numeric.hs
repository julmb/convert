{-# OPTIONS_GHC -Wno-orphans #-}

module Data.Convert.Numeric () where

import Data.Void
import Data.Bits
import Data.Word
import Data.Int
import Data.Convert.Tools
import Data.Convert.Class
import Numeric.Natural

instance Convert Void Word8 Word16 where convert = intoTotal . fromIntegral
instance Convert Void Word8 Word32 where convert = intoTotal . fromIntegral
instance Convert Void Word8 Word64 where convert = intoTotal . fromIntegral
instance Convert Void Word8 Word where convert = intoTotal . fromIntegral
instance Convert Void Word8 Natural where convert = intoTotal . fromIntegral
instance Convert Unit Word8 Int8 where convert = intoPartial . toIntegralSized
instance Convert Void Word8 Int16 where convert = intoTotal . fromIntegral
instance Convert Void Word8 Int32 where convert = intoTotal . fromIntegral
instance Convert Void Word8 Int64 where convert = intoTotal . fromIntegral
instance Convert Void Word8 Int where convert = intoTotal . fromIntegral
instance Convert Void Word8 Integer where convert = intoTotal . fromIntegral

instance Convert Unit Word16 Word8 where convert = intoPartial . toIntegralSized
instance Convert Void Word16 Word32 where convert = intoTotal . fromIntegral
instance Convert Void Word16 Word64 where convert = intoTotal . fromIntegral
instance Convert Void Word16 Word where convert = intoTotal . fromIntegral
instance Convert Void Word16 Natural where convert = intoTotal . fromIntegral
instance Convert Unit Word16 Int8 where convert = intoPartial . toIntegralSized
instance Convert Unit Word16 Int16 where convert = intoPartial . toIntegralSized
instance Convert Void Word16 Int32 where convert = intoTotal . fromIntegral
instance Convert Void Word16 Int64 where convert = intoTotal . fromIntegral
instance Convert Void Word16 Int where convert = intoTotal . fromIntegral
instance Convert Void Word16 Integer where convert = intoTotal . fromIntegral

instance Convert Unit Word32 Word8 where convert = intoPartial . toIntegralSized
instance Convert Unit Word32 Word16 where convert = intoPartial . toIntegralSized
instance Convert Void Word32 Word64 where convert = intoTotal . fromIntegral
instance Convert Void Word32 Word where convert = intoTotal . fromIntegral
instance Convert Void Word32 Natural where convert = intoTotal . fromIntegral
instance Convert Unit Word32 Int8 where convert = intoPartial . toIntegralSized
instance Convert Unit Word32 Int16 where convert = intoPartial . toIntegralSized
instance Convert Unit Word32 Int32 where convert = intoPartial . toIntegralSized
instance Convert Void Word32 Int64 where convert = intoTotal . fromIntegral
instance Convert Void Word32 Int where convert = intoTotal . fromIntegral
instance Convert Void Word32 Integer where convert = intoTotal . fromIntegral

instance Convert Unit Word64 Word8 where convert = intoPartial . toIntegralSized
instance Convert Unit Word64 Word16 where convert = intoPartial . toIntegralSized
instance Convert Unit Word64 Word32 where convert = intoPartial . toIntegralSized
instance Convert Void Word64 Word where convert = intoTotal . fromIntegral
instance Convert Void Word64 Natural where convert = intoTotal . fromIntegral
instance Convert Unit Word64 Int8 where convert = intoPartial . toIntegralSized
instance Convert Unit Word64 Int16 where convert = intoPartial . toIntegralSized
instance Convert Unit Word64 Int32 where convert = intoPartial . toIntegralSized
instance Convert Unit Word64 Int64 where convert = intoPartial . toIntegralSized
instance Convert Unit Word64 Int where convert = intoPartial . toIntegralSized
instance Convert Void Word64 Integer where convert = intoTotal . fromIntegral

instance Convert Unit Word Word8 where convert = intoPartial . toIntegralSized
instance Convert Unit Word Word16 where convert = intoPartial . toIntegralSized
instance Convert Unit Word Word32 where convert = intoPartial . toIntegralSized
instance Convert Void Word Word64 where convert = intoTotal . fromIntegral
instance Convert Void Word Natural where convert = intoTotal . fromIntegral
instance Convert Unit Word Int8 where convert = intoPartial . toIntegralSized
instance Convert Unit Word Int16 where convert = intoPartial . toIntegralSized
instance Convert Unit Word Int32 where convert = intoPartial . toIntegralSized
instance Convert Unit Word Int64 where convert = intoPartial . toIntegralSized
instance Convert Unit Word Int where convert = intoPartial . toIntegralSized
instance Convert Void Word Integer where convert = intoTotal . fromIntegral

instance Convert Unit Natural Word8 where convert = intoPartial . toIntegralSized
instance Convert Unit Natural Word16 where convert = intoPartial . toIntegralSized
instance Convert Unit Natural Word32 where convert = intoPartial . toIntegralSized
instance Convert Unit Natural Word64 where convert = intoPartial . toIntegralSized
instance Convert Unit Natural Word where convert = intoPartial . toIntegralSized
instance Convert Unit Natural Int8 where convert = intoPartial . toIntegralSized
instance Convert Unit Natural Int16 where convert = intoPartial . toIntegralSized
instance Convert Unit Natural Int32 where convert = intoPartial . toIntegralSized
instance Convert Unit Natural Int64 where convert = intoPartial . toIntegralSized
instance Convert Unit Natural Int where convert = intoPartial . toIntegralSized
instance Convert Void Natural Integer where convert = intoTotal . fromIntegral

instance Convert Unit Int8 Word8 where convert = intoPartial . toIntegralSized
instance Convert Unit Int8 Word16 where convert = intoPartial . toIntegralSized
instance Convert Unit Int8 Word32 where convert = intoPartial . toIntegralSized
instance Convert Unit Int8 Word64 where convert = intoPartial . toIntegralSized
instance Convert Unit Int8 Word where convert = intoPartial . toIntegralSized
instance Convert Unit Int8 Natural where convert = intoPartial . toIntegralSized
instance Convert Void Int8 Int16 where convert = intoTotal . fromIntegral
instance Convert Void Int8 Int32 where convert = intoTotal . fromIntegral
instance Convert Void Int8 Int64 where convert = intoTotal . fromIntegral
instance Convert Void Int8 Int where convert = intoTotal . fromIntegral
instance Convert Void Int8 Integer where convert = intoTotal . fromIntegral

instance Convert Unit Int16 Word8 where convert = intoPartial . toIntegralSized
instance Convert Unit Int16 Word16 where convert = intoPartial . toIntegralSized
instance Convert Unit Int16 Word32 where convert = intoPartial . toIntegralSized
instance Convert Unit Int16 Word64 where convert = intoPartial . toIntegralSized
instance Convert Unit Int16 Word where convert = intoPartial . toIntegralSized
instance Convert Unit Int16 Natural where convert = intoPartial . toIntegralSized
instance Convert Unit Int16 Int8 where convert = intoPartial . toIntegralSized
instance Convert Void Int16 Int32 where convert = intoTotal . fromIntegral
instance Convert Void Int16 Int64 where convert = intoTotal . fromIntegral
instance Convert Void Int16 Int where convert = intoTotal . fromIntegral
instance Convert Void Int16 Integer where convert = intoTotal . fromIntegral

instance Convert Unit Int32 Word8 where convert = intoPartial . toIntegralSized
instance Convert Unit Int32 Word16 where convert = intoPartial . toIntegralSized
instance Convert Unit Int32 Word32 where convert = intoPartial . toIntegralSized
instance Convert Unit Int32 Word64 where convert = intoPartial . toIntegralSized
instance Convert Unit Int32 Word where convert = intoPartial . toIntegralSized
instance Convert Unit Int32 Natural where convert = intoPartial . toIntegralSized
instance Convert Unit Int32 Int8 where convert = intoPartial . toIntegralSized
instance Convert Unit Int32 Int16 where convert = intoPartial . toIntegralSized
instance Convert Void Int32 Int64 where convert = intoTotal . fromIntegral
instance Convert Void Int32 Int where convert = intoTotal . fromIntegral
instance Convert Void Int32 Integer where convert = intoTotal . fromIntegral

instance Convert Unit Int64 Word8 where convert = intoPartial . toIntegralSized
instance Convert Unit Int64 Word16 where convert = intoPartial . toIntegralSized
instance Convert Unit Int64 Word32 where convert = intoPartial . toIntegralSized
instance Convert Unit Int64 Word64 where convert = intoPartial . toIntegralSized
instance Convert Unit Int64 Word where convert = intoPartial . toIntegralSized
instance Convert Unit Int64 Natural where convert = intoPartial . toIntegralSized
instance Convert Unit Int64 Int8 where convert = intoPartial . toIntegralSized
instance Convert Unit Int64 Int16 where convert = intoPartial . toIntegralSized
instance Convert Unit Int64 Int32 where convert = intoPartial . toIntegralSized
instance Convert Void Int64 Int where convert = intoTotal . fromIntegral
instance Convert Void Int64 Integer where convert = intoTotal . fromIntegral

instance Convert Unit Int Word8 where convert = intoPartial . toIntegralSized
instance Convert Unit Int Word16 where convert = intoPartial . toIntegralSized
instance Convert Unit Int Word32 where convert = intoPartial . toIntegralSized
instance Convert Unit Int Word64 where convert = intoPartial . toIntegralSized
instance Convert Unit Int Word where convert = intoPartial . toIntegralSized
instance Convert Unit Int Natural where convert = intoPartial . toIntegralSized
instance Convert Unit Int Int8 where convert = intoPartial . toIntegralSized
instance Convert Unit Int Int16 where convert = intoPartial . toIntegralSized
instance Convert Unit Int Int32 where convert = intoPartial . toIntegralSized
instance Convert Void Int Int64 where convert = intoTotal . fromIntegral
instance Convert Void Int Integer where convert = intoTotal . fromIntegral

instance Convert Unit Integer Word8 where convert = intoPartial . toIntegralSized
instance Convert Unit Integer Word16 where convert = intoPartial . toIntegralSized
instance Convert Unit Integer Word32 where convert = intoPartial . toIntegralSized
instance Convert Unit Integer Word64 where convert = intoPartial . toIntegralSized
instance Convert Unit Integer Word where convert = intoPartial . toIntegralSized
instance Convert Unit Integer Natural where convert = intoPartial . toIntegralSized
instance Convert Unit Integer Int8 where convert = intoPartial . toIntegralSized
instance Convert Unit Integer Int16 where convert = intoPartial . toIntegralSized
instance Convert Unit Integer Int32 where convert = intoPartial . toIntegralSized
instance Convert Unit Integer Int64 where convert = intoPartial . toIntegralSized
instance Convert Unit Integer Int where convert = intoPartial . toIntegralSized
