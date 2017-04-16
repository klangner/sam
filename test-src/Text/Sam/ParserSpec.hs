{-# LANGUAGE OverloadedStrings #-}
module Text.Sam.ParserSpec (spec) where

import Prelude
import Test.Hspec
import Test.QuickCheck

import Text.Sam.Parser
import Text.Sam.Document


spec :: Spec
spec =

  describe "parse" $

    it "empty document" $ do
        let str = ""
        parse str `shouldBe` emptyDoc
