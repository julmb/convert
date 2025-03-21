{-# OPTIONS_GHC -Wno-orphans #-}
{-# LANGUAGE TypeFamilies #-}

module Data.Convert.Instance () where

import Data.Text (Text)
import Data.ByteString (ByteString)
import Data.Text.Encoding qualified as T
import Data.Convert.Class
import Numeric.Natural
import Data.Bits
import Data.ByteString qualified as B
import Data.Text.Encoding.Error

instance Convert Bool Natural where
    from False = 0
    from True = 1
instance Partial Natural Bool where
    fromTry 0 = Right False
    fromTry 1 = Right True
    fromTry _ = Left ()

instance Convert ByteString Natural where
    from = B.foldl' go 0 where
        go n a = n !<<. 8 .|. fromIntegral a
instance Convert Natural ByteString where
    from = B.reverse . B.unfoldr go where
        go 0 = Nothing
        go n = Just (fromIntegral n, n !>>. 8)

instance Convert Text ByteString where from = T.encodeUtf8
instance Partial ByteString Text where
    type Failure ByteString Text = UnicodeException
    fromTry = T.decodeUtf8'
