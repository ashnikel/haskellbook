-- Exercises: Cardinality
-- 1
data PugType = PugData -- 1
-- 2
data Airline =
    PapuAir
  | CatapultsR'Us
  | TakeYourChancesUnited -- 3
-- 3
-- import Data.Int
-- maxBound :: Int16 ==> 32767
-- minBound :: Int16 ==> -32768
-- 32767 + 1 + 32768 = 65536
-- 4
-- maxBound :: Int ==> 9223372036854775807
-- minBound :: Int ==> -9223372036854775808
--9223372036854775807 + 1 + 9223372036854775808 = 18446744073709551616
-- Integer is not bounded ==> infinite
-- 5
-- Int8 - 2 ^ 8 = 256

-- Excercises: For Example
data Example = MakeExample deriving Show
-- 1
-- :t MakeExample ==> MakeExample :: Example
-- :t Example ==> Data constructor not in scope: Example
-- 2
-- :info Example ==>
--  data Example = MakeExample
--  instance [safe] Show Example
-- 3
data ExampleInt = MakeExampleInt Int deriving Show
-- :t MakeExampleInt ==> MakeExampleInt :: Int -> ExampleInt
