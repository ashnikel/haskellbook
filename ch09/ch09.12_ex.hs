import Data.Char

-- 2
uppers :: String -> String
uppers = filter isUpper

-- 3
capitFirst :: String -> String
capitFirst "" = ""
capitFirst (x:xs) = toUpper x : xs

-- 4
capitAll :: String -> String
capitAll "" = ""
capitAll (x:xs) = toUpper x : capitAll xs

-- 5, 6
capitHead :: String -> Char
-- capitHead s = toUpper (head s)
-- capitHead s = toUpper . head $ s
capitHead = toUpper . head
