{-
     Sum the odd elements in a list.
-}

import Data.List (foldl')

-- This part handles the Input/Output and can be used as it is. Do not change or modify it.
main :: IO ()
main = do
   inputdata <- getContents
   print $ f $ map (read :: String -> Int) $ lines inputdata
   
{- 
    Note: using the Prelude, this can be implemented as: f = sum . filter odd

    In this case, I assumed "filter" is a given, since it was solved in a different exercise, but "sum" is not.
-}
f :: Integral a => [a] -> a
f = foldl' (+) 0 . filter odd

