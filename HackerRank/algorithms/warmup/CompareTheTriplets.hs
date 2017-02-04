{-
    Compare two triplets, A = (a1, a2, a3) and B = (b1, b2, b3), in the following way:
    
    - Add 1 to A if ai > bi for i = 1 to 3
    - Add 1 to B if ai < bi for i = 1 to 3
    
    Input Format

        The first line contains 3 space-separated integers, a1, a2, and a3, describing the respective values in triplet A. 
        The second line contains 3 space-separated integers, a1, a2, and a3, describing the respective values in triplet B.

    Constraints
        1 <= ai, bi <= 100

    Output Format

        Print two space-separated integers denoting the respective comparison scores earned by A and B.        
-}

import Data.List (foldl')

main :: IO ()
main = do
    lineA <- getLine 
    lineB <- getLine
    let (as, bs) = (map read $ words lineA, map read $ words lineB)
    let (ra, rb) = compareTriplets as bs
    putStrLn $ show ra ++ " " ++ show rb

compareTriplets :: [Int] -> [Int] -> (Int, Int)
compareTriplets as bs = foldl' (\acc (a, b) -> comp a b acc) (0, 0) $ zip as bs
    where
        comp x y (z, w)
            | x > y     = (z + 1, w)
            | x < y     = (z, w + 1)
            | otherwise = (z, w)

