{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE NoPolyKinds #-}
{-# LANGUAGE UndecidableInstances #-}

module Data.Convert.Class
(
    Convert (..), Total, Partial, total, partial,
    Display (..), ConvertException (..), convertThrow, convertShow
)
where

import Type.Reflection
import Control.Exception
import Data.Void
import Data.Bifunctor
import Data.Convert.Tools
import Text.Printf
import GHC.Stack

class Convert e a b | a b -> e where convert :: a -> Either e b

type Total = Convert Void
type Partial = Convert Unit

total :: Total a b => a -> b
total = fromTotal . convert

partial :: Partial a b => a -> Maybe b
partial = fromPartial . convert

class Display a where display :: a -> Maybe String

instance Display Void where display = absurd
instance Display Unit where display Unit = Nothing
instance Display String where display = Just
instance {-# OVERLAPPABLE #-} Exception e => Display e where display = Just . displayException

newtype ConvertException a b e = ConvertException { content :: e }

instance (Typeable a, Typeable b, Display e) => Show (ConvertException a b e) where
    show = compose . display . content where
        compose = maybe base $ printf "%s: %s" base
        base = printf "could not convert from %s to %s" (show $ typeRep @a) (show $ typeRep @b)
instance (Typeable a, Typeable b, Typeable e, Display e) => Exception (ConvertException a b e)

wrap :: Convert e a b => a -> Either (ConvertException a b e) b
wrap = first ConvertException . convert

convertThrow :: HasCallStack => Typeable a => Typeable b => Typeable e => Display e => Convert e a b => a -> b
convertThrow = either throw id . wrap

convertShow :: Typeable a => Typeable b => Display e => Convert e a b => a -> Either String b
convertShow = first show . wrap
