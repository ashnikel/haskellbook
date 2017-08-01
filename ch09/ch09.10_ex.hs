-- 1
filter (\x -> rem x 3 == 0) [1..30]
[x | x <- [1..30], rem x 3 ==0]
-- 2
length $ filter (\x -> rem x 3 == 0) [1..30]
-- 3 see ch09.10_myFilter.hs
