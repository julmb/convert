{-# LANGUAGE NoPolyKinds #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE UndecidableInstances #-}

module Data.Convert.Class
(
    Convert (..), Total, Partial, total, partial,
    Display (..), ConvertException (..), cast, spell
)
where

import Type.Reflection
import Control.Exception
import Data.Void
import Data.Bifunctor
import Data.Convert.Tools
import Text.Printf

class Convert e a b | a b -> e where convert :: a -> Either e b

instance Convert Void a a where convert = Right

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

-- TODO: in base-4.21, `throw` gains `HasCallStack` constraint
--       should we propagate this constraint here?
cast :: Typeable a => Typeable b => Typeable e => Display e => Convert e a b => a -> b
cast = either throw id . wrap

spell :: Typeable a => Typeable b => Display e => Convert e a b => a -> Either String b
spell = first show . wrap
