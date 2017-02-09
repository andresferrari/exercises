{-
    Given to strings P=p1...pN and Q=q1...qN of equal lengths, return the "mingled" string Z 
    of the same length with the following structure: Z=p1q1...pNqN. 
    
    Input Format
    
        The strings P and N each in a separate line.
        
    Output Format
        
        The mingled string Z.
-}

main :: IO ()
main = do
    p <- getLine
    q <- getLine
    putStrLn $ mingle p q

-- Extension to the requirements: stop when one of the strings runs out.
mingle :: [a] -> [a] -> [a]
mingle = ming []
    where
        ming z [] []         = reverse z
        ming z [] _          = ming z [] [] -- Not the same length!
        ming z _ []          = ming z [] [] -- Not the same length!
        ming z (p:ps) (q:qs) = ming (q:p:z) ps qs
        
-- Alternative implementation using standard functions:
--mingle p q = foldr (\(x, y) z -> x:y:z) [] $ zip p q
