{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FunctionalDependencies #-}

module Text.Conversion where

import Data.Kind (Type)

data Encoding = Ascii | UTF8 | Latin1
  deriving stock (Eq, Show)

class HasTextRepresentation (enc :: Encoding) bs t | enc -> t, t -> enc where
  type TextRepError enc :: Type
  toText :: bs -> Either (TextRepError enc) t
  fromText :: t -> bs
