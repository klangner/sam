{-# LANGUAGE OverloadedStrings #-}
module Text.Sam.TokenizerSpec (spec) where

import Prelude
import Test.Hspec
import Test.QuickCheck

import Text.Sam.Tokenizer (tokenize)


spec :: Spec
spec =

  describe "tokenize" $

    it "empty string" $ do
        tokenize "" `shouldBe` []
