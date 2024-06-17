import Data.List

data Tree a = Empty | Branch a (Tree a) (Tree a)
  deriving (Show, Eq)


-- Problem 56 (**)
-- Symmetric binary trees.

symmetric :: Tree a -> Bool
symmetric Empty = True
symmetric (Branch _ left right) = mirror left right

mirror :: Tree a -> Tree a -> Bool
mirror Empty Empty = True
mirror Empty _ = False
mirror _ Empty = False
mirror (Branch _ l1 r1) (Branch _ l2 r2) = mirror l1 l2 && mirror r1 r2


-- Problem 57 (**)
-- Binary search trees.

split :: [a] -> ([a], [a])
split xs = splitAt (div (length xs - 1) 2) xs

constructBST :: (Ord a, Eq a) => [a] -> Tree a
constructBST [] = Empty 
constructBST [x] = Branch x Empty Empty
constructBST [x,y]
  | x > y = Branch x (constructBST [y]) Empty
  | otherwise = Branch y (constructBST [x]) Empty
constructBST xs = Branch mid (constructBST left) (constructBST right)
  where
    xss    = (split. sort) xs
    left   = fst xss
    right  = fst xss
    mid    = head right
    right' = tail right
