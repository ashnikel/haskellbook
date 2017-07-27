myWords :: String -> [String]
myWords = splitOnChar ' '

splitOnChar :: Char -> String -> [String]
splitOnChar _ [] = []
splitOnChar c (x : xs)
    | c == x = splitOnChar c xs
    | otherwise = takeWhile (/= c) (x:xs)
                  : splitOnChar c (dropWhile(/= c) (x:xs))
