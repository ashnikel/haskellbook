-- 1
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] _ = True
isSubseqOf _ [] = False
isSubseqOf xxs@(x:xs) (y:ys)
    | x == y = isSubseqOf xs ys
    | x /= y = isSubseqOf xxs ys
isSubseqOf [x] [y]
    | x == y = True
    | x /= y = False

-- Prelude> isSubseqOf "blah" "blahwoot"
-- True
-- Prelude> isSubseqOf "blah" "wootblah"
-- True
-- Prelude> isSubseqOf "blah" "wboloath"
-- True
-- Prelude> isSubseqOf "blah" "wootbla"
-- False
-- Prelude> isSubseqOf "blah" "halbwoot"
-- False
-- Prelude> isSubseqOf "blah" "blawhoot"
-- True
