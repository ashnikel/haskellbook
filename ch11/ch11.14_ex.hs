data Quad =
      One
    | Two
    | Three
    | Four
    deriving (Eq, Show)

-- 1
eQuad :: Either Quad Quad
eQuad = undefined -- 4 + 4 = 8

-- 2
prodQuad :: (Quad, Quad)
prodQuad = undefined -- 4 * 4 = 16

-- 3
funcQuad :: Quad -> Quad
funcQuad = undefined -- 4 ^ 4 = 256

-- 4
prodTBool :: (Bool, Bool, Bool)
prodTBool = undefined -- 2 * 2 * 2 = 8

-- 5
gTwo :: Bool -> Bool -> Bool
gTwo = undefined -- 2 ^ 2 ^ 2 = 16

-- 6
fTwo :: Bool -> Quad -> Quad
fTwo = undefined -- 4 ^ 4 ^ 2 = 65536
