{-
    Compute all possible left-rotations of a string.
    
    Input Format
    
        A line with the number of test cases, T.
        T lines, each containing a string of lowercase characters a-z.
        
    Constraints

        1 <= T <= 10
        1 <= length of each string <= 10^2
        
    Output Format
        
        For each string of length N, print each of the N rotations in the same line. 
-}

main :: IO ()
main = do
    _ <- getLine
    input <- getContents
    mapM_ (putStrLn . unwords . rotations) $ lines input

rotations :: [a] -> [[a]]
rotations [] = []
rotations s  = head $ tail $ rot 2 (length sRotations) [] (concat $ repeat sRotations)
    where
        sRotations = rot lenS lenS [] (concat $ repeat s)
        lenS       = length s
        rot n ln rs xs
            | n == 0    = reverse rs
            | otherwise = rot (n-1) ln (take ln xs : rs) (tail xs)
            
