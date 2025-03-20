{-# OPTIONS_GHC -Wno-orphans #-}

module Data.Convert.Instance () where

import Data.Text (Text)
import Data.ByteString (ByteString)
import Data.Text.Encoding qualified as T
import Data.Convert.Class
import Numeric.Natural
import Data.Word
import Data.Bits
import Data.ByteString qualified as B
import Data.Int

instance Convert Bool Natural where
    convert False = 0
    convert True = 1
instance Partial Natural Bool where
    partial 0 = Right False
    partial 1 = Right True
    partial _ = Left Empty

instance Convert Word8 Natural where convert = fromIntegral
instance Partial Natural Word8 where partial = mkEmpty . toIntegralSized

instance Convert Word16 Natural where convert = fromIntegral
instance Partial Natural Word16 where partial = mkEmpty . toIntegralSized

instance Convert Word32 Natural where convert = fromIntegral
instance Partial Natural Word32 where partial = mkEmpty . toIntegralSized

instance Convert Word64 Natural where convert = fromIntegral
instance Partial Natural Word64 where partial = mkEmpty . toIntegralSized

instance Convert Int Int64 where convert = fromIntegral
instance Partial Int64 Int where partial = mkEmpty . toIntegralSized

instance Partial Int Word8 where partial = mkEmpty . toIntegralSized
instance Partial Word8 Int where partial = mkEmpty . toIntegralSized

instance Partial Int Natural where partial = mkEmpty . toIntegralSized
instance Partial Natural Int where partial = mkEmpty . toIntegralSized

instance Convert Natural Integer where convert = toInteger
instance Partial Integer Natural where partial = mkEmpty . toIntegralSized

instance Convert ByteString Natural where
    convert = flip B.foldl' 0 $ \ n a -> n !<<. 8 .|. fromIntegral a
instance Convert Natural ByteString where
    convert = B.reverse . B.unfoldr go where
        go 0 = Nothing
        go n = Just (fromIntegral n, n !>>. 8)

instance Convert Text ByteString where convert = T.encodeUtf8
instance Partial ByteString Text where partial = mkError . T.decodeUtf8'
