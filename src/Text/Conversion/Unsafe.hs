{-# LANGUAGE FlexibleContexts #-}

module Text.Conversion.Unsafe where

import Data.Text (Text)
import Text.Conversion (HasTextRepresentation(toText, TextRepError))

unsafeToText :: (HasTextRepresentation enc a Text, Show (TextRepError enc)) => a -> Text
unsafeToText = either (error . show) id . toText
