module LangEx where

import Data.Char
-- 1
capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x:xs) = toUpper x : xs

-- 2
capitalizeParagraph :: String -> String
capitalizeParagraph = unwords . capitalizeOnPeriod . words . capitalizeWord

capitalizeOnPeriod :: [String] -> [String]
capitalizeOnPeriod [] = []
capitalizeOnPeriod [x] = [x]
capitalizeOnPeriod (x:y:xs)
    | last x == '.' =  x : capitalizeOnPeriod (capitalizeWord y : xs)
    | otherwise     =  x : capitalizeOnPeriod (y : xs)

-- Prelude > capitalizeParagraph "quick brown. fox. jumps over. the lazy. dog."
-- "Quick brown. Fox. Jumps over. The lazy. Dog."
