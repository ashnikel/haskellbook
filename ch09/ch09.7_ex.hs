-- Comprehend Thy Lists
mySqr = [x^2 | x <- [1..5]]
f1 = [x | x <- mySqr, rem x 2 == 0] -- ==> [4,16]
f2 = [(x, y) | x <- mySqr, y <-mySqr, x < 50, y > 50] -- ==> []
f3 = take 5 [(x, y) | x <- mySqr
            , y <- mySqr, x < 50, y > 50] -- ==> []

-- Square Cube
myCube = [y^3 | y <- [1..5]]
-- 1
tups = [(x, y) | x <- mySqr, y <-myCube]
--2
tups50 = [(x, y) | x <- mySqr, y <-myCube, x < 50, y < 50]
--3
tupsLength = length tups50
