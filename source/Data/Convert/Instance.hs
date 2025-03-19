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
import Text.Printf
import Data.Convert.Tools
import Data.Text.Encoding.Error

instance Convert Bool Natural where
    convert False = 0
    convert True = 1
instance Partial String Natural Bool where
    partial 0 = Right False
    partial 1 = Right True
    partial n = Left $ printf "expected 0 or 1, got %d" n

instance Convert Word8 Natural where convert = fromIntegral
instance Partial String Natural Word8 where partial = maybeToEitherMessage toIntegralSized

instance Convert Word16 Natural where convert = fromIntegral
instance Partial String Natural Word16 where partial = maybeToEitherMessage toIntegralSized

instance Convert Word32 Natural where convert = fromIntegral
instance Partial String Natural Word32 where partial = maybeToEitherMessage toIntegralSized

instance Convert Word64 Natural where convert = fromIntegral
instance Partial String Natural Word64 where partial = maybeToEitherMessage toIntegralSized

instance Convert Int Int64 where convert = fromIntegral
instance Partial String Int64 Int where partial = maybeToEitherMessage toIntegralSized

instance Partial String Int Word8 where partial = maybeToEitherMessage toIntegralSized
instance Partial String Word8 Int where partial = maybeToEitherMessage toIntegralSized

instance Partial String Int Natural where partial = maybeToEitherMessage toIntegralSized
instance Partial String Natural Int where partial = maybeToEitherMessage toIntegralSized

instance Convert Natural Integer where convert = toInteger
instance Partial String Integer Natural where partial = maybeToEitherMessage toIntegralSized

instance Convert ByteString Natural where
    convert = flip B.foldl' 0 $ \ n a -> n !<<. 8 .|. fromIntegral a
instance Convert Natural ByteString where
    convert = B.reverse . B.unfoldr go where
        go 0 = Nothing
        go n = Just (fromIntegral n, n !>>. 8)

instance Convert Text ByteString where convert = T.encodeUtf8
instance Partial UnicodeException ByteString Text where partial = T.decodeUtf8'
