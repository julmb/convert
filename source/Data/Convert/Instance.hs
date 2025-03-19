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

instance Convert Bool Natural where
    convert False = 0
    convert True = 1
instance Transform Natural Bool where
    transform 0 = Right False
    transform 1 = Right True
    transform _ = Left ()

instance Convert Word8 Natural where convert = fromIntegral
instance Transform Natural Word8 where transform = maybeToEither . toIntegralSized

instance Convert Word16 Natural where convert = fromIntegral
instance Transform Natural Word16 where transform = maybeToEither . toIntegralSized

instance Convert Word32 Natural where convert = fromIntegral
instance Transform Natural Word32 where transform = maybeToEither . toIntegralSized

instance Convert Word64 Natural where convert = fromIntegral
instance Transform Natural Word64 where transform = maybeToEither . toIntegralSized

instance Convert ByteString Natural where
    convert = flip B.foldl' 0 $ \ n a -> n !<<. 8 .|. fromIntegral a
instance Convert Natural ByteString where
    convert = B.reverse . B.unfoldr go where
        go 0 = Nothing
        go n = Just (fromIntegral n, n !>>. 8)

instance Convert Text ByteString where convert = T.encodeUtf8
instance Transform ByteString Text where
    type Failure ByteString Text = T.UnicodeException
    transform = T.decodeUtf8'
