module LatinDiacritics where

import Prelude

import Data.Maybe (Maybe(Just, Nothing))
import Data.String.CodeUnits (indexOf, singleton, toCharArray, fromCharArray)
import Data.String.Pattern (Pattern(Pattern))

isIn :: Char -> String -> Boolean
isIn needle haystack = 
  let result = indexOf (Pattern (singleton needle)) haystack
  in case result of 
       Just _ -> true 
       Nothing -> false 
    
removeDiacritic :: Char -> Char
removeDiacritic character =
  case character of 
    _ | isIn character "ÀÀÁÂÃĀĂȦÄẢÅǍȀȂĄẠḀẦẤẪẨẰẮẴẲǠǞǺẬẶȺ" -> 'A'
    _ | isIn character "ǼǢ" -> 'Æ'
    _ | isIn character "ḂƁḄḆƂɃ" -> 'B'
    _ | isIn character "ĆĈĊČƇÇḈȻ" -> 'C'
    _ | isIn character "ḊƊḌḎḐḒĎÐĐƉƋ" -> 'D'
    _ | isIn character "ÈÉÊẼĒĔĖËẺĚȄȆẸȨĘḘḚỀẾỄỂḔḖỆḜɆƐ" -> 'E'
    _ | isIn character "ḞƑ" -> 'F'
    _ | isIn character "ǴĜḠĞĠǦƓĢǤ" -> 'G'
    _ | isIn character "ĤḦȞḤḨḪĦⱧ" -> 'H'
    _ | isIn character "ÌÍÎĨĪĬİÏỈǏỊĮȈȊḬƗḮ" -> 'I'
    _ | isIn character "ĴɈ" -> 'J'
    _ | isIn character "ḰǨḴƘḲĶⱩ" -> 'K'
    _ | isIn character "ĹḺḶĻḼĽĿŁḸȽⱠⱢ" -> 'L'
    _ | isIn character "ḾṀṂⱮ" -> 'M'
    _ | isIn character "ǸŃÑṄŇŊƝṆŅṊṈȠ" -> 'N'
    _ | isIn character "ÒÓÔÕŌŎȮÖỎŐǑȌȎƠǪỌƟØỒỐỖỔȰȪȬṌṐṒỜỚỠỞỢǬỘǾƆ" -> 'O'
   --  ŒƢ
    _ | isIn character "ṔṖƤⱣ" -> 'P'
    _ | isIn character "Ɋ" -> 'Q'
    _ | isIn character "ŔṘŘȐȒṚŖṞṜƦɌⱤ" -> 'R'
    _ | isIn character "ŚŜṠŠṢȘŞⱾṤṦṨ" -> 'S'
    -- ẞ
    _ | isIn character "ṪŤƬƮṬȚŢṰṮŦȾ" -> 'T'
    _ | isIn character "ÙÚÛŨŪŬÜỦŮŰǓȔȖƯỤṲŲṶṴṸǛǗǕǙỪỨỬỰɄ" -> 'U'
    _ | isIn character "ṼṾƲ" -> 'V'
    _ | isIn character "ẀẂŴẆẄẈⱲ" -> 'W'
    _ | isIn character "ẊẌ" -> 'X'
    _ | isIn character "ỲÝŶỸȲẎŸỶƳỴɎ" -> 'Y'
    _ | isIn character "ŹẐŻŽȤẒẔƵⱿⱫ" -> 'Z'
    _ | isIn character "àáâãāăȧäảåǎȁȃąạḁẚầấẫẩằắẵẳǡǟǻậặⱥɑ" -> 'a'
    _ | isIn character "æǽǣ" -> 'æ'
    _ | isIn character "ḃɓḅḇƀƃ" -> 'b'
    _ | isIn character "ćĉċčƈçḉȼ" -> 'c'
    _ | isIn character "ḋɗḍḏḑḓďđƌȡ" -> 'd'
    _ | isIn character "èéêẽēĕėëẻěȅȇẹȩęḙḛềếễểḕḗệḝɇɛǝⱸ" -> 'e'
    _ | isIn character "ḟƒ" -> 'f'
    _ | isIn character "ĝḡğġǧɠģǵǥ" -> 'g'
    _ | isIn character "ĥḣḧȟḥḩḫẖħⱨ" -> 'h'
    _ | isIn character "ìíîĩīĭıïỉǐịįȉȋḭɨḯ" -> 'i'
   --  _ | isIn character "ĳ" -> 'i' -- What do we do here?
    _ | isIn character "ĵǰȷɉ" -> 'j'
    _ | isIn character "ḱǩḵƙḳķĸⱪ" -> 'k'
    _ | isIn character "ĺḻḷļḽľŀłƚḹȴⱡ" -> 'l'
    _ | isIn character "ḿṁṃɱ" -> 'm'
    _ | isIn character "ǹńñṅňŋɲṇņṋṉŉƞȵ" -> 'n'
    _ | isIn character "òóôõōŏȯöỏőǒȍȏơǫọɵøồốỗổȱȫȭṍṏṑṓờớỡởợǭộǿɔ" -> 'o'
   --  _ | isIn character "œ
    _ | isIn character "ⱺ" -> 'o'
   --  _ | isIn character "ƣ
    _ | isIn character "ṕṗƥ" -> 'p'
    _ | isIn character "ɋ" -> 'q'
    _ | isIn character "ŕṙřȑȓṛŗṟṝɍⱹ" -> 'r'
    _ | isIn character "śŝṡšṣșşȿṥṧṩ" -> 's'
   -- _ | isIn character "ß"
    _ | isIn character "ſẛ" -> 's'
    _ | isIn character "ẗťƭʈƫṭțţṱṯŧⱦȶ" -> 't'
    _ | isIn character "ùúûũūŭüủůűǔȕȗưụṳųṷṵṹṻǜǘǖǚừứữửựʉ" -> 'u'
    _ | isIn character "ṽṿⱱⱴ" -> 'v'
    _ | isIn character "ẁẃŵẇẅẘẉⱳ" -> 'w'
    _ | isIn character "ẋẍ" -> 'x'
    _ | isIn character "ỳýŷȳẏÿỷẙƴỵɏ" -> 'y'
    _ | isIn character "źẑżžȥẓẕƶɀⱬ" -> 'z'
    other -> other

removeDiacritics :: String -> String
removeDiacritics aString =
  fromCharArray (map removeDiacritic (toCharArray aString))
