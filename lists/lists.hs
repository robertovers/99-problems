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

-- Problem 6 (*)
-- Find out whether a list is a palindrome.

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome list = myReverse list == list


main :: IO ()
main = do
  let out = isPalindrome [1, 2, 3, 2, 1]
  print out
