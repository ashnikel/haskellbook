data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

-- 1
unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold f a =
    case f a of
        Nothing -> Leaf
        Just (a1,b,a2) -> Node (unfold f a1) b (unfold f a2)

-- 2
treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold (\x -> if x > 0 then Just (x-1, n-x, x-1) else Nothing) n
