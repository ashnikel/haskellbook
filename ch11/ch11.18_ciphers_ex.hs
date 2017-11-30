module Vigenere where

import           Data.Char

shiftr :: Char -> Char -> Char
shiftr origLetter passLetter
    | origLetter == ' '   = ' '
    | (orig + shift) <= z = chr (orig + shift)
    | otherwise           = chr (a + (shift - (z - orig)) - 1)
    where shift = ord passLetter - ord 'a'
          orig  = ord origLetter
          a     = ord 'a'
          z     = ord 'z'

shiftl :: Char -> Char -> Char
shiftl origLetter passLetter
    | origLetter == ' '   = ' '
    | (orig - shift) >= a = chr (orig - shift)
    | otherwise           = chr (z - (shift - (orig - a)) + 1)
    where shift = ord passLetter - ord 'a'
          orig  = ord origLetter
          a     = ord 'a'
          z     = ord 'z'

encode :: String -> String -> String
encode message password = zipWith shiftr message (concat $ repeat password)

decode :: String -> String -> String
decode message password = zipWith shiftl message (concat $ repeat password)
