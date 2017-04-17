import Test.Hspec
import Test.QuickCheck
import qualified Text.Sam.TokenizerSpec


main :: IO ()
main = hspec $ do
  describe "Tokenizer" Text.Sam.TokenizerSpec.spec
