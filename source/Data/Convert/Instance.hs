{-# OPTIONS_GHC -Wno-orphans #-}
{-# LANGUAGE TypeFamilies #-}

module Data.Convert.Instance () where

import Data.Text (Text)
import Data.ByteString (ByteString)
import Data.Text.Encoding qualified as T
import Data.Convert.Class
import Numeric.Natural
import Data.Word
import Data.Bits
import Data.ByteString qualified as B
import Data.Text.Encoding.Error qualified as T
import Data.Int
import Text.Printf
import Data.Convert.Tools

instance Convert Bool Natural where
    convert False = 0
    convert True = 1
instance Partial Natural Bool where
    type Failure Natural Bool = String
    partial 0 = Right False
    partial 1 = Right True
    partial n = Left $ printf "expected 0 or 1, got %d" n

instance Convert Word8 Natural where convert = fromIntegral
instance Partial Natural Word8 where type Failure Natural Word8 = String; partial = maybeToEitherMessage toIntegralSized

instance Convert Word16 Natural where convert = fromIntegral
instance Partial Natural Word16 where type Failure Natural Word16 = String; partial = maybeToEitherMessage toIntegralSized

instance Convert Word32 Natural where convert = fromIntegral
instance Partial Natural Word32 where type Failure Natural Word32 = String; partial = maybeToEitherMessage toIntegralSized

instance Convert Word64 Natural where convert = fromIntegral
instance Partial Natural Word64 where type Failure Natural Word64 = String; partial = maybeToEitherMessage toIntegralSized

instance Convert Int Int64 where convert = fromIntegral
instance Partial Int64 Int where type Failure Int64 Int = String; partial = maybeToEitherMessage toIntegralSized

instance Partial Int Word8 where type Failure Int Word8 = String; partial = maybeToEitherMessage toIntegralSized
instance Partial Word8 Int where type Failure Word8 Int = String; partial = maybeToEitherMessage toIntegralSized

instance Partial Int Natural where type Failure Int Natural = String; partial = maybeToEitherMessage toIntegralSized
instance Partial Natural Int where type Failure Natural Int = String; partial = maybeToEitherMessage toIntegralSized

instance Convert Natural Integer where convert = toInteger
instance Partial Integer Natural where type Failure Integer Natural = String; partial = maybeToEitherMessage toIntegralSized

instance Convert ByteString Natural where
    convert = flip B.foldl' 0 $ \ n a -> n !<<. 8 .|. fromIntegral a
instance Convert Natural ByteString where
    convert = B.reverse . B.unfoldr go where
        go 0 = Nothing
        go n = Just (fromIntegral n, n !>>. 8)

instance Convert Text ByteString where convert = T.encodeUtf8
instance Partial ByteString Text where
    type Failure ByteString Text = T.UnicodeException
    partial = T.decodeUtf8'
