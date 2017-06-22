import Data.List (sort)

-- Multiple choice
-- 1 c
-- 2 b
-- 3 a
-- 4 c
-- 5 a

-- Does it typecheck
-- 1 No - No instance for (Show Person)
-- data Person = Person Bool
--
-- printPerson :: Person -> IO ()
-- printPerson person = putStrLn (show person)

-- 2 No - No instance for (Eq Mood)
-- data Mood = Blah
--           | Woot deriving Show
--
-- settleDown x = if x == Woot
--                  then Blah
--                  else x

-- 3
-- a) Blah, Woot
-- b) Error: No instance for (Num Mood)
-- c) Error: No instance for (Ord Mood)

-- 4 Yes
type Subject = String
type Verb = String
type Object = String

data Sentence =
    Sentence Subject Verb Object
    deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"

-- Given a datatype declaration, what can we do?
data Rocks =
    Rocks String deriving (Eq, Show)

data Yeah =
    Yeah Bool deriving (Eq, Show)

data Papu =
    Papu Rocks Yeah deriving (Eq, Show)

-- 1 No - Couldn't match expected type ‘Rocks’ with actual type ‘[Char]’
-- phew = Papu "chases" True

-- 2 Yes
truth = Papu (Rocks "chomskydoz")
             (Yeah True)

-- 3 Yes
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

-- 4 No - No instance for (Ord Papu)
-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'

-- Match the types
-- 1
i :: Num a => a
i = 1
-- No, can't replace with i :: a - No instance for (Num a) arising from the literal ‘1’

-- 2
f :: Float
f = 1.0
-- No, can't replace with f :: Num a => a - Could not deduce (Fractional a) arising from the literal ‘1.0’

-- 3
-- Yes, can be replaced with f :: Fractional a => a

-- 4
-- Yes, can be replaced with f :: RealFrac a => a

-- 5
freud :: a -> a
freud x = x
-- Yes, can be replaced with freud :: Ord a => a -> a

-- 6
-- Yes, can be replaced with freud :: Int -> Int

-- 7
myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX
-- No, can't replace with sigmund :: a -> a - Couldn't match expected type ‘a’ with actual type ‘Int’

-- 8
-- No, can't replace with sigmund :: Num a => a -> a - Couldn't match expected type ‘a’ with actual
--  type ‘Int’

-- 9
jung :: Ord a => [a] -> a
jung xs = head (sort xs)
-- Yes, can be replaced with jung :: [Int] -> Int

-- 10
young :: [Char] -> Char
young xs = head (sort xs)
-- Yes, can be replaced with young :: Ord a => a -> a

-- 11
mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (mySort xs)
-- No, can't replace with signifier :: Ord a => a -> a - Couldn't match type ‘a’ with ‘Char’
