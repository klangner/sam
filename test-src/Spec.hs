import Test.Hspec
import Test.QuickCheck
import qualified Text.Sam.ParserSpec
import qualified Text.Sam.TokenizerSpec


main :: IO ()
main = hspec $ do
  describe "Parser" Text.Sam.ParserSpec.spec
  describe "Tokenizer" Text.Sam.TokenizerSpec.spec
