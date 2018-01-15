lefts' :: [Either a b] -> [a]
lefts' = foldr f []
    where f (Left a) acc  = a : acc
          f (Right _) acc = acc

rights' :: [Either a b] -> [b]
rights' = foldr f []
    where f (Right b) acc = b : acc
          f (Left _) acc  = acc

partitionEithers' :: [Either a b]
                  -> ([a], [b])
partitionEithers' lst = (lefts' lst, rights' lst)

eitherMaybe' :: (b -> c)
             -> Either a b
             -> Maybe c
eitherMaybe' _ (Left _) = Nothing
eitherMaybe' f (Right b) = Just $ f b

either' :: (a -> c)
        -> (b -> c)
        -> Either a b
        -> c
either' fa _ (Left a) = fa a
either' _ fb (Right b) = fb b

eitherMaybe'' :: (b -> c)
              -> Either a b
              -> Maybe c
eitherMaybe'' f = either' (\x -> Nothing) (Just . f)