module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import LatinDiacritics as LatinDiacritics

removeDiacritics :: String -> String
removeDiacritics = LatinDiacritics.removeDiacritics

main :: Effect Unit
main = do
  log "Welcome to the Latin Diacritic Remover"
