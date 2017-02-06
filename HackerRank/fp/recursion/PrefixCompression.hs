{-
    You are given two strings X and Y. You need to find the longest common prefix P of the two strings. 
    Then you will output substrings P, X' and Y', where X' and Y' are the substrings left after stripping P 
    from X and Y, respectively.

    For example, if 
        X="abcdefpr"
        Y="abcpqr"
    then  
        P="abc"
        X'="defpr"
        Y'="pqr"
        
    Input Format
        Two lines, first X then Y.
        
    Constraints
        - X and Y only contain lowercase latin characters from a-z.
        - 1 <= length(X), length(Y) <= 10^5
        
    Output Format
        Print in separate lines:
        - length(P) P
        - length(X') X
        - legnth(Y') Y
        
    Sample Input
        kitkat
        kit
        
    Sample Output
        3 kit
        3 kat
        0
-}

main :: IO ()
main = do
    x <- getLine
    y <- getLine
    let (p, x', y') = prefixCompression x y
    mapM_ (\s -> putStrLn $ show (length s) ++ " " ++ s) [p, x', y']
    
prefixCompression :: Eq a => [a] -> [a] -> ([a], [a], [a])
prefixCompression = findPref []
    where
        findPref p x y = case (x, y) of
            (z:zs, w:ws) -> if z == w then findPref (z:p) zs ws else (reverse p, x, y)
            _            -> (reverse p, x, y) 
