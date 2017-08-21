import           Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
    [ DbDate (UTCTime
              (fromGregorian 1911 5 1)
              (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
              (fromGregorian 1921 5 1)
              (secondsToDiffTime 34123))
    ]

-- 1
filterDbDate :: [DatabaseItem]
             -> [UTCTime]
filterDbDate = foldr f []
    where f (DbDate d) acc = d : acc
          f _ acc          = acc

-- 2
filterDbNumber :: [DatabaseItem]
               -> [Integer]
filterDbNumber = foldr f []
    where f (DbNumber n) acc = n : acc
          f _ acc            = acc

-- 3
mostRecent :: [DatabaseItem]
           -> UTCTime
mostRecent = last . filterDbDate

-- 4
sumDb :: [DatabaseItem]
      -> Integer
sumDb = sum . filterDbNumber

-- 5
avgDb :: [DatabaseItem]
      -> Double
avgDb db = fromIntegral (sumDb db) / fromIntegral (length $ filterDbNumber db)
