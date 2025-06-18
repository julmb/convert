{-# OPTIONS_GHC -Wno-orphans #-}

module Data.Convert.Instance () where

import Data.Void
import Data.Bits
import Data.ByteString (ByteString)
import Data.ByteString qualified as B
import Data.Text (Text)
import Data.Text.Encoding qualified as T
import Data.Text.Encoding.Error (UnicodeException)
import Data.Convert.Class
import Numeric.Natural

instance Partial Bool Natural Void where
    fromTry False = Right 0
    fromTry True = Right 1
instance Partial Natural Bool () where
    fromTry 0 = Right False
    fromTry 1 = Right True
    fromTry _ = Left ()

instance Partial Natural ByteString Void where
    fromTry = Right . B.reverse . B.unfoldr go where
        go 0 = Nothing
        go n = Just (fromIntegral n, n !>>. 8)
instance Partial ByteString Natural Void where
    fromTry = Right . B.foldl' go 0 where
        go n a = n !<<. 8 .|. fromIntegral a

instance Partial Text ByteString Void where fromTry = Right . T.encodeUtf8
instance Partial ByteString Text UnicodeException where fromTry = T.decodeUtf8'
