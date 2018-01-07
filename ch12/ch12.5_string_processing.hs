module StrProc where

-- 1
notThe :: String -> Maybe String
notThe "the" = Nothing
notThe s     = Just s

replaceThe :: String -> String
replaceThe = unwords . replaceThe' . words

replaceThe' :: [String] -> [String]
replaceThe' [] = []
replaceThe' (x:xs)
    | x == "the" = "a" : replaceThe' xs
    | otherwise  = x : replaceThe' xs

-- 2
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel = countTheBeforeVowel' . words

countTheBeforeVowel' :: [String] -> Integer
countTheBeforeVowel' [] = 0
countTheBeforeVowel' [_] = 0
countTheBeforeVowel' (x:y:xs)
    | x == "the" && head y `elem` vowels = 1 + countTheBeforeVowel' xs
    | otherwise = countTheBeforeVowel' (y:xs)

vowels :: String
vowels = "aeiou"

-- 3
countVowels :: String -> Integer
countVowels "" = 0
countVowels (x:xs)
    | x `elem` vowels = 1 + countVowels xs
    | otherwise = countVowels xs
