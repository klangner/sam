{-# LANGUAGE OverloadedStrings #-}
module Text.Sam.TokenizerSpec (spec) where

import Prelude
import Data.Text (Text, pack)
import Data.Text.Arbitrary
import Test.Hspec
import Test.QuickCheck

import Text.Sam.Tokenizer (Token(..), join, tokenize)


spec :: Spec
spec =

  describe "tokenize" $ do

    it "abcd" $
        tokenize "abcd" `shouldBe` [Word "abcd"]

    it "abcd34" $
        tokenize "abcd34" `shouldBe` [Word "abcd", Number "34"]

    it "34  abcd" $
        tokenize "34  abcd" `shouldBe` [Number "34", Whitespace "  ", Word "abcd"]

    it "new line" $
        tokenize " \n " `shouldBe` [Whitespace " ", NewLine, Whitespace " "]

    it "special chars" $
        tokenize "-?" `shouldBe` [SpecialChar '-', SpecialChar '?']

    it "invariant: join . tokenizer" $ property $
        \str -> (join . tokenize) str == str

