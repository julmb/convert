{-# OPTIONS_GHC -Wno-orphans #-}

module Data.Convert.Instance () where

import Data.Void
import Data.Bits
import Data.ByteString (ByteString)
import Data.ByteString qualified as B
import Data.Text (Text)
import Data.Text.Encoding qualified as T
import Data.Text.Encoding.Error (UnicodeException)
import Data.Convert.Tools
import Data.Convert.Class
import Numeric.Natural

instance Convert Void Bool Natural where
    convert False = Right 0
    convert True = Right 1
instance Convert Unit Natural Bool where
    convert 0 = Right False
    convert 1 = Right True
    convert _ = Left Unit

instance Convert Void Natural ByteString where
    convert = Right . B.reverse . B.unfoldr go where
        go 0 = Nothing
        go n = Just (fromIntegral n, n !>>. 8)
instance Convert Void ByteString Natural where
    convert = Right . B.foldl' go 0 where
        go n a = n !<<. 8 .|. fromIntegral a

instance Convert Void Text ByteString where convert = Right . T.encodeUtf8
instance Convert UnicodeException ByteString Text where convert = T.decodeUtf8'
