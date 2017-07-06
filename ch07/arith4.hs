module Arith4 where

-- id :: a -> a
-- id x = x

roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

-- 5
roundTripPF :: (Show a, Read a) => a -> a
roundTripPF = read . show

-- 6
roundTripAB :: (Show a, Read b) => a -> b
roundTripAB = read . show

main = do
    print (roundTrip 4)
    print (roundTripPF 4)
    print (roundTripAB 4 :: Int)
    print (id 4)
