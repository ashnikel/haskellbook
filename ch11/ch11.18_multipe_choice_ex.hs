-- Multipe choice
-- 1
data Weekday =
      Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
-- a) Week is a type with five data constructors
-- 2
f Friday = "Miller Time"
-- c) f :: Weekday -> String
-- 3
-- b) must begin with a capital letter
-- 4
g xs = xs !! (length xs - 1)
-- c) delivers the final element of xs
