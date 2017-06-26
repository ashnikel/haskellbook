-- 1 a, b, c and d are equivalents.
-- 2 d

-- 3
-- a
addOneIfOdd n = case odd n of
    True -> f n
    False -> n
    where f = \n -> n + 1

-- b
addFiveAnon = \x -> \y -> (if x > y then y else x) + 5

-- c
mflip f x y = f y x
