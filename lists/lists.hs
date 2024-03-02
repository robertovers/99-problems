-- Problem 1
-- Find the last element of a list.

myLast :: [a] -> a
myLast = last


-- Problem 2
-- Find the last-but-one (or second-last) element of a list.

myButLast :: [a] -> a
myButLast lst = last $ init lst


-- Problem 3
-- Find the Kth element of a list.

elementAt :: [a] -> Int -> a
elementAt (x:xs) 1 = x
elementAt (x:xs) k = elementAt xs (k-1)


main :: IO ()
main = do
  let out = elementAt [1, 2, 3, 4] 3
  print out
