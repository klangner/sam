{-# LANGUAGE OverloadedStrings #-}
module Text.Sam.Tokenizer where

import Control.Applicative
import Data.Char (isAlpha, isDigit, isSpace)
import qualified Data.Text as T
import qualified Data.Attoparsec.Text as P


-- | Possible tokens
data Token = Word T.Text
           | Number T.Text
           | Whitespace T.Text
           | SpecialChar Char
           | NewLine
           deriving (Eq, Show)

-- Convert Token into Text representation
tokenText :: Token -> T.Text
tokenText (Word str) = str
tokenText (Number str) = str
tokenText (Whitespace str) = str
tokenText (SpecialChar c) = T.singleton c
tokenText NewLine = "\n"


-- | Convert list of tokens back to the text
join :: [Token] -> T.Text
join xs = T.concat $ map tokenText xs


-- | Convert given text into list of tokens
tokenize :: T.Text -> [Token]
tokenize str = case P.parseOnly tokens str of
  Left _    -> []
  Right xs  -> xs

-- | Consume all tokens from the input
tokens :: P.Parser [Token]
tokens = many $  word
             <|> number
             <|> whitespaces
             <|> specialChar
             <|> newLine

-- | Consume all letters
word :: P.Parser Token
word = Word <$> P.takeWhile1 isAlpha

-- | Consume all digits
number :: P.Parser Token
number = Number <$> P.takeWhile1 isDigit

-- | Consume all white spaces
whitespaces :: P.Parser Token
whitespaces = Whitespace <$> P.takeWhile1 (\c -> (isSpace c && c /= '\n'))

-- | Consume all special characters
specialChar :: P.Parser Token
specialChar = SpecialChar <$> P.satisfy (\c -> normalChar c == False)
  where normalChar c = isSpace c || isAlpha c || isDigit c

-- | Consume new line
newLine :: P.Parser Token
newLine = P.char '\n' >> return NewLine
