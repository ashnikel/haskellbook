module Natural where

data Nat =
      Zero
    | Succ Nat
    deriving (Eq, Show)

-- >>> natToInteger Zero
-- 0
-- >>> natToInteger (Succ Zero)
-- 1
-- >>> natToInteger (Succ (Succ Zero))
-- 2
natToInteger :: Nat -> Integer
natToInteger Zero     = 0
natToInteger (Succ n) = 1 + natToInteger n

-- >>> integerToNat 0
-- Just Zero
-- >>> integerToNat 1
-- Just (Succ Zero)
-- >>> integerToNat 2
-- Just (Succ (Succ Zero))
-- >>> integerToNat (-1)
-- Nothing
integerToNat :: Integer -> Maybe Nat
integerToNat x
    | x < 0     = Nothing
    | otherwise = Just (integerToNat' x)

integerToNat' :: Integer -> Nat
integerToNat' 0 = Zero
integerToNat' x = Succ (integerToNat' (x-1))