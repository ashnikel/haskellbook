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
comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'

-- Match the types
-- 1
i :: Num a => a
i = 1
