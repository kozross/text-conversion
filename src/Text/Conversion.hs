{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FunctionalDependencies #-}

module Text.Conversion where

import qualified Data.ByteString.Lazy as LBS
import qualified Text.Ascii as AT
import Data.Word (Word8)
import Data.ByteString (ByteString)
import qualified Data.ByteString as BS
import Data.Maybe (fromJust)
import Text.Ascii (AsciiText)
import Data.Kind (Type)

data Encoding = Ascii | UTF8 | Latin1
  deriving stock (Eq, Show)

newtype AsciiDecodingError = InvalidByte Word8
  deriving stock (Eq, Show)

class HasTextRepresentation (enc :: Encoding) bs t | enc -> t, t -> enc where
  type TextRepError enc :: Type
  toText :: bs -> Either (TextRepError enc) t
  fromText :: t -> bs

instance HasTextRepresentation 'Ascii ByteString AsciiText where
  type TextRepError 'Ascii = AsciiDecodingError
  toText bs = case AT.fromByteString bs of 
    Nothing -> Left . InvalidByte . fromJust . BS.find (> 127) $ bs
    Just at -> pure at
  fromText = AT.toByteString

instance HasTextRepresentation 'Ascii LBS.ByteString AsciiText where
  type TextRepError 'Ascii = AsciiDecodingError
  toText bs = case AT.fromByteString . LBS.toStrict $ bs of 
    Nothing -> Left . InvalidByte . fromJust . LBS.find (> 127) $ bs
    Just at -> pure at
  fromText = LBS.fromStrict . AT.toByteString
