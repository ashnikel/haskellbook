import System.IO

type Name = String
type Age  = Integer

data Person = Person Name Age deriving Show

data PersonInvalid =
      NameEmpty
    | AgeTooLow
    | PersonInvalidUnknown String
    deriving (Eq, Show)

mkPerson :: Name
         -> Age
         -> Either PersonInvalid Person
mkPerson name age
    | name /= "" && age > 0 = Right $ Person name age
    | name == "" = Left NameEmpty
    | not (age > 0) = Left AgeTooLow
    | otherwise = Left $ PersonInvalidUnknown $
                    "Name was: " ++ show name ++
                    "Age was: "  ++ show age

gimmePerson :: IO ()
gimmePerson = do
    putStr "Enter person name: "
    name <- getLine
    putStr "Enter age: "
    age <- getLine
    case mkPerson name (read age :: Age) of
        Right person ->
            putStrLn $ "Yay! Successfully got a person: " ++ show person
        Left NameEmpty ->
            putStrLn "Error: Name is empty"
        Left AgeTooLow ->
            putStrLn "Error: Age too low"
        Left invalid ->
            putStrLn $ "Error: " ++ show invalid
