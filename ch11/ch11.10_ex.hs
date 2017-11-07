import           Data.Int

-- 1
data BigSmall =
    Big Bool
  | Small Bool
 deriving (Eq, Show)
-- cardinality is 2 + 2 = 4

-- 2
data NumberOrBool =
    Numba Int8
  | BoolyBool Bool
  deriving (Eq, Show)
-- cardinality is 256 + 2 = 258

-- Numba 130, Numba (-130) ==> [-Woverflowed-literals] Literal 128 is out
-- of the Int8 range -128..127

data Fiction = Fiction deriving Show
data Nonfiction = Nonfiction deriving Show

data BookType = FictionBook Fiction
              | NonfictionBook Nonfiction
              deriving Show
