module Cipher where

import Data.Char

shiftr :: Int -> Char -> Char
shiftr i c
    | (ch + i) <= z = chr (ch + i)
    | otherwise = chr (a + (i - (z - ch)) - 1)
    where ch = ord c
          a  = ord 'a'
          z  = ord 'z'

shiftl :: Int -> Char -> Char
shiftl i c
    | (ch - i) >= a = chr (ch - i)
    | otherwise = chr (z - (i - (ch - a)) + 1)
    where ch = ord c
          a  = ord 'a'
          z  = ord 'z'

caesar :: Int -> String -> String
caesar i s = map (shiftr (i `mod` 26)) s

unCaesar :: Int -> String -> String
unCaesar i s = map (shiftl (i `mod` 26)) s
