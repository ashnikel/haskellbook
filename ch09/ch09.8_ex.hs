-- Will it blow up?
[x^y | x <- [1..5],y <- [2, undefined]] -- ⊥
take 1 $ [x^y | x <- [1..5], y <- [2, undefined]] -- [1]
sum [1, undefined, 3] -- ⊥
length [1, 2, undefined] -- 3
length $ [1, 2, 3] ++ undefined -- ⊥
take 1 $ filter even [1, 2, 3, undefined] -- [2]
take 1 $ filter even [1, 3, undefined] -- ⊥
take 1 $ filter odd [1, 3, undefined] -- [1]
take 2 $ filter odd [1, 3, undefined] -- [1, 3]
take 3 $ filter odd [1, 3, undefined] -- ⊥

-- Is it in normal form?
[1, 2, 3, 4, 5] -- NF
1 : 2 : 3 : 4 : _ -- WHNF
enumFromTo 1 10 -- neither
length [1, 2, 3, 4, 5] -- neither
sum (enumFromTo 1 10) -- neither
['a'..'m'] ++ ['n'..'z'] -- neither
(_, 'b') -- WHNF
