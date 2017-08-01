myFilter :: String -> [String]
myFilter = filter (\x -> notElem x ["a", "an", "the"]) . words 
