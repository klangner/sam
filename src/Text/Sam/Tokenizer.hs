{-# LANGUAGE OverloadedStrings #-}
module Text.Sam.Tokenizer where

-- | Possible tokens
data Token = Word String
           | Number Integer
           | WhiteSpace String
           | SpecialChar Char
           deriving (Show, Eq)


-- | Convert given text into list of tokens
tokenize :: String -> [Token]
tokenize _ = []