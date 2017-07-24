module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n =
    case n of
        0 -> "zero"
        1 -> "one"
        2 -> "two"
        3 -> "three"
        4 -> "four"
        5 -> "five"
        6 -> "six"
        7 -> "seven"
        8 -> "eight"
        9 -> "nine"
        otherwise -> "ERROR"

digits :: Int -> [Int]
digits n = go n []
    where go n ints
           | n <= 9 = n : ints
           | otherwise = go (n `div` 10) (( n `mod` 10) : ints)

wordNumber :: Int -> String
wordNumber = concat . intersperse "-" . map digitToWord . digits
