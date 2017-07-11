-- Multiple choice
-- 1 d
-- 2 b
-- 3 d
-- 4 b
-- 5 a

-- Let's write code
-- 1
-- a
tensDigit :: Integral a => a -> a
tensDigit x = d
    where (xLast, _) = x `divMod` 10
          (_, d)     = xLast `divMod` 10

-- b - Yes

-- c
hunsD x = d2
    where d  = x `div` 100
          d2 = d `mod` 10

-- 2
foldBool :: a -> a -> Bool -> a
foldBool x y b = case b of
    True  -> x
    False -> y

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y b
    | b == True  = x
    | b == False = y

-- 3
g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c)

-- 4, 5, 6 see arith4.hs
