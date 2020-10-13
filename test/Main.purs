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
