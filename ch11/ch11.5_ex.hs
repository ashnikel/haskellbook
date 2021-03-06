data Doggies a =
    Husky a
  | Mastiff a
  deriving (Eq, Show)

data DogueDeBordeaux doge =
    DogueDeBordeaux doge
-- 1 - Doggies is a type constructor
-- 2 - :kind Doggies :: * -> *
-- 3 - :kind Doggies String :: *
-- 4 - :type Husky 10 :: Num a => Doggies a
-- 5 - :type Husky (10 :: Integer) :: Doggies Integer
-- 6 - :type Mastiff "Scooby Doo" :: Doggies String
-- 7 - DogueDeBordeaux is a type constructor and a data constructor
-- 8 - :type DogueDeBordeaux :: doge -> DogueDeBordeaux doge
-- 9 - :type DogueDeBordeaux "doggie!" :: DogueDeBordeaux String
