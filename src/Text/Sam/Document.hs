{-# LANGUAGE OverloadedStrings #-}
module Text.Sam.Document where

-- | Position in the document
type Pos = Int

-- | Single feature
data Feature = Line Pos Pos         -- ^ Line with start and end index
             | Word Pos String      -- ^ Word with start position and text
             deriving (Eq, Show)

-- | Document is a list of features
data Document = Doc [Feature]
                deriving (Eq, Show)


-- | Create empty doc without any features
emptyDoc :: Document
emptyDoc = Doc []