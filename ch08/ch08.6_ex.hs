-- Review of types
-- 1 d
-- 2 b
-- 3 d
-- 4 b

-- Reviewing currying
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty = cattyConny "woops"
frappe = flippy "haha"

-- 1: appedCatty "woohoo!" ==> "woops mrow haha"
-- 2: frappe "1" ==> "1 mrow haha"
-- 3: frappe (appedCatty "2") ==> "woops mrow 2 mrow haha"
-- 4: appedCatty (frappe "blue") ==> "woops mrow blue mrow haha"
-- 5 cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue")) ==>
--   "pink mrow haha mrow green mrow woops mrow blue"
-- 6 cattyConny (flippy "Pugs" "are") "awesome" ==> "are mrow Pugs mrow awesome"

-- Recursion
-- 1
-- devidedBy 15 2
-- go 15 2 0
--     go 13 2 1
--         go 11 2 2
--             go 9 2 3
--                 go 7 2 4
--                     go 5 2 5
--                         go 3 2 6
--                             go 1 2 7
--                               | (1 < 2) = (7, 1)

-- 2
recurSum :: (Eq a, Num a) => a -> a
recurSum n = go n 0
    where go n accum
           | n == 0 = accum
           | otherwise = go (n - 1) (accum + n)

-- 3
recurMult :: (Integral a) => a -> a -> a
recurMult x y = go x y 0
    where go x y accum
           | x == 0 = accum
           | x >  0 = go (x - 1) y (accum + y)
           | x <  0 = go (x + 1) y (accum - y)

-- Fixing dividedBy
data DividedResult a =
    Result (a, a)
  | DividedByZero
  deriving Show

dividedBy :: Integral a => a -> a -> DividedResult a
dividedBy num denom = go num denom 0
    where go n   d count
           | d == 0 = DividedByZero
           | abs n < abs d = Result (count, n)
           | signum d /= signum n = go (n + d) d (count - 1) -- ((+) div (-)) or ((-) div (+))
           | otherwise = go (n - d) d (count + 1) -- ((+) div (+)) or ((-) div (-))
