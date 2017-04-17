{-# LANGUAGE OverloadedStrings #-}
module Text.Sam.TokenizerSpec (spec) where

import Prelude
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

    it "34abcd" $
        tokenize "34abcd" `shouldBe` [Number "34", Word "abcd"]

--     it "invariant: join . tokenizer" $ property $
--         \str -> (join . tokenize) str == str

