module Phone where

import           Data.Char  (isAlphaNum, toLower)
import           Data.List  (elemIndex, find, group, sort)
import           Data.Maybe (fromMaybe)

convo :: [String]
convo = [ "Wanna play 20 questions"
        , "Ya"
        , "U 1st haha"
        , "Lol ok. Have u ever tasted alcohol"
        , "Lol ya"
        , "Wow ur cool haha. Ur turn"
        , "Ok. Do u think I am pretty Lol"
        , "Lol ya"
        , "Just making sure rofl ur turn"
        ]

-- validButtons = "1234567890*#"
type Digit = Char

-- Valid presses: 1 and up
type Presses = Int

data DaPhone = DaPhone [(Digit, String)]
    deriving (Eq, Show)

phone :: DaPhone
phone = DaPhone [ ('1', "1")
                , ('2', "abc2")
                , ('3', "def3")
                , ('4', "ghi4")
                , ('5', "jkl5")
                , ('6', "mno6")
                , ('7', "pqrs7")
                , ('8', "tuv8")
                , ('9', "wxyz9")
                , ('0', " 0")
                , ('#', ".,")
                ]

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps (DaPhone ph) ch
    | ch == toLower ch = tap ch
    | otherwise        = ('*', 1) : tap (toLower ch)
    where tap c =
            case button of
                Just (num, str) -> [(num, 1 + fromMaybe (-1) (elemIndex c str))]
                Nothing         -> []
            where button = find (\(_, x) -> c `elem` x) ph

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead = concatMap . reverseTaps

cellPhonesDeadConvo :: DaPhone -> [String] -> [(Digit, Presses)]
cellPhonesDeadConvo ph str = cellPhonesDead ph $ concat str

-- 3
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = sum . map snd

-- 4
mostPopularLetter :: String -> Char
mostPopularLetter = mostPopularElem . filter isAlphaNum

mostPopularElem :: (Ord a, Eq a) => [a] -> a
mostPopularElem = snd . maximum . map (\x -> (length x, head x)) . group

letterCost :: DaPhone -> Char -> Presses
letterCost ph ch = fingerTaps $ reverseTaps ph ch

-- 5
coolestLtr :: [String] -> Char
coolestLtr = mostPopularLetter . concat

coolestWord :: [String] -> String
coolestWord = mostPopularElem . words . unwords
