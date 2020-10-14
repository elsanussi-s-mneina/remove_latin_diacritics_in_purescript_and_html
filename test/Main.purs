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
  describe "ae letter" do
    it "LATIN SMALL LETTER AE" (removeDiacritic 'æ' `shouldEqual` 'æ')
    it "LATIN SMALL LETTER AE WITH ACUTE" (removeDiacritic 'ǽ' `shouldEqual` 'æ')
    it "LATIN SMALL LETTER AE WITH MACRON" (removeDiacritic 'ǣ' `shouldEqual` 'æ')
