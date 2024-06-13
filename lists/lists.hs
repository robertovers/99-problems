-- Problem 1 (*)
-- Find the last element of a list.

myLast :: [a] -> a
myLast [a] = a
myLast (x:xs) = myLast xs


-- Problem 2 (*)
-- Find the last-but-one (or second-last) element of a list.

myButLast :: [a] -> a
myButLast [a, b] = a
myButLast (x:xs) = myButLast xs


-- Problem 3 (*)
-- Find the Kth element of a list.

elementAt :: [a] -> Int -> a
elementAt (x:xs) 1 = x
elementAt (x:xs) k = elementAt xs (k-1)


-- Problem 4 (*)
-- Find the number of elements in a list.

myLength :: [a] -> Int
myLength = foldr (\x -> (+) 1) 0


-- Problem 5 (*)
-- Reverse a list.

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

-- using accumulator

myReverseAcc :: [a] -> [a]
myReverseAcc list = myReverseAux list []

myReverseAux :: [a] -> [a] -> [a]
myReverseAux [] acc = acc
myReverseAux (x:xs) acc = myReverseAux xs (x:acc)


-- Problem 6 (*)
-- Find out whether a list is a palindrome.

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome list = myReverse list == list


-- Problem 7 (*)
-- Flatten a nested list.

myFlatten :: [[a]] -> [a]
myFlatten = foldr (++) []


-- Problem 8 (**)
-- Eliminate consecutive duplicates of list elements.

compress :: Eq a => [a] -> [a]
compress (x:xs) = x : compressAux xs x 

compressAux :: Eq a => [a] -> a -> [a]
compressAux [] _ = []
compressAux (x:xs) k
  | x == k = compressAux xs k
  | otherwise = x : compressAux xs x


-- Problem 9 (**)
-- Pack consecutive duplicates of list elements into sublists.

pack :: Eq a => [a] -> [[a]]
pack xs = packAux xs []

packAux :: Eq a => [a] -> [[a]] -> [[a]]
packAux [] acc = reverse acc
packAux (x:xs) [] = packAux xs [[x]]
packAux (x:xs) ((a:as):ys)
  | x == a = packAux xs ((x:a:as):ys)
  | otherwise = packAux xs ([x]:((a:as):ys))
