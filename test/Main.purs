module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import LatinDiacritics (removeDiacritic, removeDiacritics)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
  describe "remove diacritic" do 
    it "Á" (removeDiacritic 'Á' `shouldEqual` 'A')
    it "Ḇ" (removeDiacritic 'Ḇ' `shouldEqual` 'B')
    it "Ċ" (removeDiacritic 'Ċ' `shouldEqual` 'C')
    it "ÁḆĊé" (removeDiacritics "ÁḆĊé" `shouldEqual` "ABCe")
  describe "remove acute accent" do
    it "LATIN SMALL LETTER G WITH ACUTE" (removeDiacritics "ǵ" `shouldEqual` "g")
    it "á" (removeDiacritic 'á' `shouldEqual` 'a')
    it "é" (removeDiacritic 'é' `shouldEqual` 'e')
    it "í" (removeDiacritic 'í' `shouldEqual` 'i')
    it "ó" (removeDiacritic 'ó' `shouldEqual` 'o')
    it "ú" (removeDiacritic 'ú' `shouldEqual` 'u')
    it "Á" (removeDiacritic 'Á' `shouldEqual` 'A')
    it "É" (removeDiacritic 'É' `shouldEqual` 'E')
    it "Í" (removeDiacritic 'Í' `shouldEqual` 'I')
    it "Ó" (removeDiacritic 'Ó' `shouldEqual` 'O')
    it "Ú" (removeDiacritic 'Ú' `shouldEqual` 'U')
    it "LATIN CAPITAL LETTER Y WITH ACUTE" (removeDiacritic 'Ý' `shouldEqual` 'Y')
    it "the rest of the letters ÝĆćĹĺŃńŔŕŚśŹźǴǵǼǽḰḱḾḿṔṕẂẃ" (removeDiacritics "ÝĆćĹĺŃńŔŕŚśŹźǴǵǼǽḰḱḾḿṔṕẂẃ" `shouldEqual` "YCcLlNnRrSsZzGgÆæKkMmPpWw")
    it "áéíóú" do 
      (removeDiacritics "áéíóú" `shouldEqual` "aeiou")
      (removeDiacritics "úóíéá" `shouldEqual` "uoiea")
      (removeDiacritics "ÁÉÍÓÚ" `shouldEqual` "AEIOU")
  describe "remove acute accent with dot above" do
    it "small letter s, and capital s"  
      (removeDiacritics "Ṥṥ" `shouldEqual` "Ss")
  describe "ae letter" do
    it "LATIN SMALL LETTER AE" (removeDiacritic 'æ' `shouldEqual` 'æ')
    it "LATIN SMALL LETTER AE WITH ACUTE" (removeDiacritic 'ǽ' `shouldEqual` 'æ')
    it "LATIN SMALL LETTER AE WITH MACRON" (removeDiacritic 'ǣ' `shouldEqual` 'æ')
    it "LATIN CAPITAL LETTER AE WITH ACUTE" (removeDiacritic 'Ǽ' `shouldEqual` 'Æ')
    it "LATIN CAPITAL LETTER AE WITH MACRON" (removeDiacritic 'Ǣ' `shouldEqual` 'Æ')
