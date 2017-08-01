myFilter :: String -> [String]
myFilter s = filter (\x -> notElem x ["a", "an", "the"]) $ words s
