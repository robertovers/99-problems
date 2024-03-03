-- Problem 1
-- Find the last element of a list.

myLast :: [a] -> a
myLast [a] = a
myLast (x:xs) = myLast xs


-- Problem 2
-- Find the last-but-one (or second-last) element of a list.

myButLast :: [a] -> a
myButLast [a, b] = a
myButLast (x:xs) = myButLast xs


-- Problem 3
-- Find the Kth element of a list.

elementAt :: [a] -> Int -> a
elementAt (x:xs) 1 = x
elementAt (x:xs) k = elementAt xs (k-1)


-- Problem 4
-- Find the number of elements in a list.




main :: IO ()
main = do
  let out = myLast [1, 2, 3, 4]
  print out
