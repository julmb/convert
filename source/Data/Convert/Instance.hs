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
import Data.Int
import Data.Text.Encoding.Error
import Data.Convert.Tools

instance Convert Bool Natural where
    from False = 0
    from True = 1
instance Partial Natural Bool where
    fromTry 0 = Right False
    fromTry 1 = Right True
    fromTry _ = Left ()

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

instance Convert ByteString Natural where
    from = flip B.foldl' 0 $ \ n a -> n !<<. 8 .|. fromIntegral a
instance Convert Natural ByteString where
    from = B.reverse . B.unfoldr go where
        go 0 = Nothing
        go n = Just (fromIntegral n, n !>>. 8)

instance Convert Text ByteString where from = T.encodeUtf8
instance Partial ByteString Text where
    type Fail ByteString Text = UnicodeException
    fromTry = T.decodeUtf8'
