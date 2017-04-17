{-# LANGUAGE OverloadedStrings #-}
module Text.Sam.Tokenizer where

import Control.Applicative
import Data.Char (isAlpha, isDigit)
import Data.Text (Text, pack)
import qualified Data.Attoparsec.Text as P


-- | Possible tokens
data Token = Word Text
           | Number Text
           | WhiteSpace Text
           | SpecialChar Char
           deriving (Show, Eq)


-- | Convert list of tokens back to the text
join :: [Token] -> Text
join xs = pack $ concatMap show xs


-- | Convert given text into list of tokens
tokenize :: Text -> [Token]
tokenize str = case P.parseOnly tokens str of
  Left _    -> []
  Right xs  -> xs

-- | Consume all tokens from the input
tokens :: P.Parser [Token]
tokens = many $ word <|> number

-- | Consume all letters
word :: P.Parser Token
word = Word <$> P.takeWhile1 isAlpha

-- | Consume all digits
number :: P.Parser Token
number = Number <$> P.takeWhile1 isDigit
