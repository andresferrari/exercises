{-
    Sum a list of N big integers, where each integer is between 0 and 10^10.
-}

import Data.List (foldl')

main :: IO ()
main = do
    _ <- getLine -- discard it
    line <- getLine
    let xs = map read $ words line
    print $ sumList xs

-- I assumed I cannot use 'sum' from the Prelude
sumList :: [Integer] -> Integer
sumList = foldl' (+) 0

