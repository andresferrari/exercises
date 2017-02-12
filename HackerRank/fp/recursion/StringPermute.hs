{-
    Given a string of even length L, permute the characters at i and i+1 for every even position i.
    
    Input Format
    
        A line with the number of test cases, T.
        T lines, each containing a string for a test case.
        
    Constraints

        1 <= T <= 10
        1 < L <= 10^5
        L is even
        Strings have all characters belonging to { a, b, ... z }
        
    Output Format
        
        T lines of output strings after the permutations.
-}

main :: IO ()
main = do
    _ <- getLine
    input <- getContents
    mapM_ (putStrLn . permute) $ lines input

-- Goes beyond the requirement, and handles strings of odd length (in which case, it ignores the last position)
permute :: [a] -> [a]
permute s = case s of
    []       -> []
    (x:y:xs) -> y:x:permute xs
    _        -> s

