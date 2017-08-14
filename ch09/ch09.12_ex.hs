import           Data.Char

-- 2
uppers :: String -> String
uppers = filter isUpper

-- 3
capitFirst :: String -> String
capitFirst ""     = ""
capitFirst (x:xs) = toUpper x : xs

-- 4
capitAll :: String -> String
capitAll ""     = ""
capitAll (x:xs) = toUpper x : capitAll xs

-- 5, 6
capitHead :: String -> Char
-- capitHead s = toUpper (head s)
-- capitHead s = toUpper . head $ s
capitHead = toUpper . head

-- Ciphers - see ch09.12_cipher.hs

-- Writing your own standard functions
-- 1
myOr :: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = x || myOr xs
-- 2
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []     = False
myAny f (x:xs) = f x || myAny f xs
-- 3
myElem :: Eq a => a -> [a] -> Bool
myElem _ []     = False
myElem e (x:xs) = (e == x) || myElem e xs
-- 3'
myElem' :: Eq a => a -> [a] -> Bool
myElem' _ [] = False
myElem' e xs = any (== e) xs
--4
myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = (myReverse xs) ++ [x]
-- 5
squish :: [[a]] -> [a]
squish [x]    = x
squish (x:xs) = x ++ squish xs
-- 6
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs
-- 7
squishAgain :: [[a]] -> [a]
squishAgain xs = squishMap (\x -> x) xs
-- 8
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ (x:[]) = x
myMaximumBy f (x:y:zs) =
    case f x y of
        GT        -> myMaximumBy f (x:zs)
        otherwise -> myMaximumBy f (y:zs)
-- 9
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ (x:[]) = x
myMinimumBy f (x:y:zs) =
    case f x y of
        LT        -> myMinimumBy f (x:zs)
        otherwise -> myMinimumBy f (y:zs)

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
