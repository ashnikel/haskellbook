
-- 1
take 1 $ map (+1) [undefined, 2, 3] -- ⊥
-- 2
take 1 $ map (+1) [1, undefined, 3] -- [2]
-- 3
take 2 $ map (+1) [1, undefined, 3] -- ⊥
-- 4
-- itIsMystery takes string and return list of bools where True correspond to vowel and False to consonant for input string
itIsMystery :: String -> [Bool]
itIsMystery xs = map (\x -> elem x "aeiou") xs
-- 5
map (^2) [1..10] -- [1,4,9,16,25,36,49,64,81,100]
-- 6
import Data.Bool
map (\x -> bool (x) (-x) (x == 3)) [1..10]
