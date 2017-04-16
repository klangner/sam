import Test.Hspec
import Test.QuickCheck
import qualified Text.Sam.ParserSpec


main :: IO ()
main = hspec $ do
  describe "Parser" Text.Sam.ParserSpec.spec
