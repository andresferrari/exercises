{-
    Update the values of a list with their absolute values. 

    Input Format

        There are N integers, each on a separate line. These are the N elements of the input list.

    Output Format

        Output the absolute value of N integers, each on a separate line in the same input order.
-}

-- This section handles the Input/Output and can be used as it is. Do not modify it.
main :: IO ()
main = do
   inputdata <- getContents
   mapM_ print $ f $ map (read :: String -> Int) $ lines inputdata

f :: (Ord a, Num a) => [a] -> [a]
f = map (\x -> if x < 0 then -x else x)

