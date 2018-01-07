module Validate where

newtype Word' =
    Word' String
    deriving (Eq, Show)

vowels :: String
vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord str
    | 2 * countVowels str <= fromIntegral (length str) = Just (Word' str)
    | otherwise = Nothing

countVowels :: String -> Integer
countVowels "" = 0
countVowels (x:xs)
    | x `elem` vowels = 1 + countVowels xs
    | otherwise = countVowels xs
