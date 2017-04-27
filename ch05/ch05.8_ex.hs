-- 5.8 Exercises
-- Multiple choise
-- 1 c
-- 2 a
-- 3 b
-- 4 c

-- Determine the type
{-# LANGUAGE NoMonomorphismRestriction #-}
module DetermineTheType where

-- simple example
example = (length [1, 2, 3, 4]) > (length "TACOCAT")
-- 1
-- a) (* 9) 6 :: Num a => a
-- b) head [(0,"doge"),(1,"kitteh")] :: Num a => (a, [Char])
-- c) head [(0 :: Integer,"doge"),(1,"kitteh")] :: (Integer, [Char])
-- d) if False then True else False :: Bool
-- e) length [1, 2, 3, 4, 5] :: Int
-- f) (length [1, 2, 3, 4]) > (length "TACOCAT") :: Bool
-- 2
x = 5
y = x + 5
w = y * 10
-- w :: Num a => a
-- 3
z y = y * 10
-- z :: Num a => a -> a
-- 4
f = 4 / y
-- f :: Fractional a => a
-- 5
x' = "Julie"
y' = " <3 "
z' = "Haskell"
f' = x' ++ y' ++ z'
-- f` :: [Char]

-- Does it compile?
-- 1
bigNum = (^) 5 $ 10
-- wahoo = bigNum $ 10
wahoo = bigNum + 10
-- 2
x1 = print
y1 = print "hoohoo!"
z1 = x1 "hello world"
-- 3
a1 = (+)
b1 = 5
c1 = a1 b1 10
d1 = a1 c1 200
-- 4
a2 = 12 + b2
b2 = 10000 * c2
c2 = 3

-- Type variable or specific type constructor?
-- 2. f :: zed -> Zed -> Blah
--         [0]    [1]    [2]
-- [0] - fully polymorphic, [1] and [2] - concrete
-- 3. f :: Enum b => a -> b -> C
--                  [0]  [1]  [2]
-- [0] - fully polymorphic, [1] - constained polymorphic, [2] - concrete
-- 4. f :: f -> g -> C
--        [0]  [1]  [2]
-- [0]  and [1] - fully polymorphic, [2] - concrete

-- Write a type signature
-- 1
functionH :: [a] -> a
functionH (x:_) = x
-- 2
functionC :: Ord a => a -> a -> Bool
functionC x y = if (x > y) then True else False
-- 3
functionS :: (a, b) -> b
functionS (x, y) = y

-- Given a type, write the function
-- 1
i :: a -> a
i x = x
-- 2
c :: a -> b -> a
c x _ = x
-- 3
c'' :: b -> a -> b
c'' x _ = x
-- 4
c' :: a -> b -> b
c' _ x = x
-- 5
r :: [a] -> [a]
r (x:xs) = xs
-- 6
co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC (aToB a)
-- 7
a :: (a -> c) -> a -> a
a _ x = x
-- 8
a' :: (a -> b) -> a -> b
a' f x = f x
