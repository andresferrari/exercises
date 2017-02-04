{-
    Given an array of N integers, find the sum of its elements.

    Input Format

        The first line contains an integer, N, denoting the size of the array. 
        The second line contains N space-separated integers representing the array's elements.

    Output Format

        Print the sum of the array's elements as a single integer.
-}

import Data.List (foldl')

main :: IO ()
main = do
    _ <- getLine -- discard it
    line <- getLine
    let xs = map read $ words line
    print $ sumList xs

-- I assumed I cannot use 'sum' from the Prelude
sumList :: [Int] -> Int
{- 
-- Explicitly recursive version
sumList = doSum 0
    where
        doSum n xs = case xs of
            []     -> n
            (y:ys) -> doSum (n+y) ys
-}
sumList = foldl' (+) 0
