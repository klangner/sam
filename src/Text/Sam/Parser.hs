module Text.Sam.Parser where

data Document = Text String
              | Empty
              deriving (Eq, Show)


-- | Parse document
parse :: String -> Document
parse _ = Empty

