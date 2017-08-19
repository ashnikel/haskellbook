-- 1 b c
-- 2
foldl (flip (*)) 1 [1..3]
f = flip (*)
foldl f 1 (1:2:3:[])
foldl f (f 1 1) (2:3:[])
foldl f (f (f 1 1) 2) (3:[])
foldl f (f (f (f 1 1) 2) 3) []
f (f (f 1 1) 2) 3
f (f (1 * 1) 2) 3
f (f 1 2) 3
f (2 * 1) 3
f 2 3
3 * 2
6
-- 3 c
-- 4 a
-- 5
foldr (++) "" ["woot", "WOOT", "woot"]
foldr max ' ' "fear is the little death"
foldr (&&) True [False, True]
foldr (||) False [False, True]
foldr ((++) . show) "" [1..5]
foldr (flip const) 'a' [1..5]
foldr (flip const) 0 "tacos"
foldl const 0 "burritos"
foldl const 'z' [1..5]
