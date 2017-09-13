-- Warm-up and review
-- 1
stops = "pbtdkg"
vowels = "aeiou"
-- a)
tuples = [ (a, b, c) | a <- stops, b <- vowels, c <- stops ]
-- b)
tuplesP = [ (a, b, c) | a <- stops, b <- vowels, c <- stops, a == 'p' ]
-- c)
nouns = ["balance", "farm", "coal", "fall", "chin", "fire"]
verbs = ["yell", "pull", "admire", "learn", "visit", "plant"]
sentence = [ (a, b, c) | a <- nouns, b <- verbs, c <- nouns ]

-- 2
-- Calculate average word length in string
seekritFunc :: String -> Int
seekritFunc x =
    div (sum (map length (words x)))
        (length (words x))

seekritFunc' :: Fractional a => String -> a
seekritFunc' x =
    fromIntegral (sum (map length (words x)))
    / fromIntegral (length (words x))

-- Rewriting functions using folds
-- 1
myOr :: [Bool] -> Bool
myOr = foldr (||) False
-- 2
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\a b -> if f a then True else b) False
-- 3
myElem :: Eq a => a -> [a] -> Bool
myElem x = foldr (\a b -> if a == x then True else b) False
myElem' :: Eq a => a -> [a] -> Bool
myElem' x = any (== x)
-- 4
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []
-- 5
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\a b -> f a : b) []
-- 6
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\a b -> if f a then a : b else b) []
-- 7
squish :: [[a]] -> [a]
squish = foldr (++) []
-- 8
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\a b -> f a ++ b) []
-- 9
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id
-- 10
myMaximumBy :: (a -> a -> Ordering)
            -> [a]
            -> a
myMaximumBy f xs = foldr (\a b -> if f a b == GT then a else b) (last xs) xs
-- 11
myMinimumBy :: (a -> a -> Ordering)
            -> [a]
            -> a
myMinimumBy f xs = foldr (\a b -> if f a b == LT then a else b) (last xs) xs
