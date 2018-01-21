-- 1
-- >>> take 10 $ myIterate (+1) 0
-- [0,1,2,3,4,5,6,7,8,9]
myIterate :: (a -> a) -> a -> [a]
myIterate f z = z : myIterate f (f z)

-- 2
-- >>> take 10 $ myUnfoldr (\b -> Just (b, b+1)) 0
-- [0,1,2,3,4,5,6,7,8,9]

myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f z =
    case f z of
        Nothing -> []
        Just (a, b) -> a : myUnfoldr f b

-- 3
betterIterate :: (a -> a) -> a -> [a]
betterIterate f z = myUnfoldr (\x -> Just (x, f x)) z