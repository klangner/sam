module Text.Sam.ParserSpec where

import Prelude
import Test.Hspec
import Test.QuickCheck

import Text.Sam.Parser


spec :: Spec
spec =

  describe "parse" $

    it "empty document" $ do
        let str = ""
        parse str `shouldBe` Empty
