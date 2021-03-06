module PoemLines where

firstSen  = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen  = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

myLines :: String -> [String]
myLines = splitOnChar '\n'

splitOnChar :: Char -> String -> [String]
splitOnChar _ [] = []
splitOnChar c (x : xs)
    | c == x = splitOnChar c xs
    | otherwise = takeWhile (/= c) (x:xs)
                  : splitOnChar c (dropWhile(/= c) (x:xs))

shouldEqual =
    [ "Tyger Tyger, burning bright"
    , "In the forests of the night"
    , "What immortal hand or eye"
    , "Could frame thy fearful symmetry?"
    ]

main :: IO ()
main =
    print $ "Are the equal? "
            ++ show (splitOnChar '\n' sentences == shouldEqual)
