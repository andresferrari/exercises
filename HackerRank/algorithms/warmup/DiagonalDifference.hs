{-
    Given a square matrix of size NxN, calculate the absolute difference between the sums of its diagonals.

    Input Format

        The first line contains a single integer N. The next N lines denote the matrix's rows, with each line containing 
        N space-separated integers describing the columns.

    Output Format

        Print the absolute difference between the two sums of the matrix's diagonals as a single integer.
-}

import Control.Monad (replicateM)
import Data.Functor ((<$>))

main :: IO ()
main = do
    n <- readLn :: IO Int 
    rows <- replicateM n $ (map read . words) <$> getLine
    putStrLn $ either id show $ diagonalDifference n rows

{- 
    The absolute difference of the two diagonals of a square matrix of NxN.
    If the matrix is malformed the function returns a Left error.
-}
diagonalDifference :: Int -> [[Integer]] -> Either String Integer
diagonalDifference n rows = 
    if isSquare n rows 
        then Right $ abs $ diagonalSum rows - diagonalSum (reverse rows) 
        else Left $ "matrix is not a square of " ++ show n ++ "x" ++ show n

isSquare :: Int -> [[a]] -> Bool
isSquare n rows = length rows == n && all (\r -> n == length r) rows

{- 
    Sums the diagonal of a square matrix of NxN numbers. 
    Assumes the matrix is well formed.
-}
diagonalSum :: (Show a, Num a) => [[a]] -> a
diagonalSum = diagSum 0 0
    where
        diagSum :: (Show a, Num a) => Int -> a -> [[a]] -> a
        diagSum i s rows = case rows of
            []     -> s
            (r:rs) -> diagSum (i + 1) (s + head (drop i r)) rs
