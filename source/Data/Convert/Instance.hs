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

instance Convert Bool Natural Void where
    fromTry False = Right 0
    fromTry True = Right 1
instance Convert Natural Bool () where
    fromTry 0 = Right False
    fromTry 1 = Right True
    fromTry _ = Left ()

instance Convert Natural ByteString Void where
    fromTry = Right . B.reverse . B.unfoldr go where
        go 0 = Nothing
        go n = Just (fromIntegral n, n !>>. 8)
instance Convert ByteString Natural Void where
    fromTry = Right . B.foldl' go 0 where
        go n a = n !<<. 8 .|. fromIntegral a

instance Convert Text ByteString Void where fromTry = Right . T.encodeUtf8
instance Convert ByteString Text UnicodeException where fromTry = T.decodeUtf8'
