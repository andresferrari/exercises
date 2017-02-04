{-
    Identifying whether a relation represents a valid function. 
    
    You are given a set of unique (x, y) ordered pairs constituting a relation. The x-values form the domain, and the 
    y-values form the range to which they map. For each of these relations, identify whether they may possibly represent 
    a valid function or not.

    Note: You do not have to find the actual function, you just need to determine that the relation may be representative 
    of some valid function.

    Input Format

        The first line contains an integer T denoting the number of test cases. The subsequent lines describe T test 
        cases, and the input for each test case is as follows:

        1. The first line contains an integer N, the number of (x, y) pairs in the test case.
        
        2. The N subsequent lines each contain two space-separated integers describing the respective x and y values for
           each ordered pair.
           
    Constraints
        
        1 <= T <= 5
        2 <= N <= 100
        0 <= x, y <= 500
        x and y are both integers
-}

import Control.Monad (replicateM)
import qualified Data.Map as M

main :: IO ()
main = do
    n <- readLn :: IO Int
    scenarios <- replicateM n readScenario
    let res = map isFunc scenarios
    mapM_ (putStrLn . (\x -> if x then "YES" else "NO")) res
    
readScenario :: IO [(Int, Int)]
readScenario = do
    n <- readLn :: IO Int
    rawScenario <- replicateM n getLine
    let scenLines = map words rawScenario
    return $ map (\x -> (read $ head x, read $ last x)) scenLines 
    
isFunc :: Ord a => [(a, a)] -> Bool
isFunc = checkF M.empty
    where
        -- Builds a map of (x, y) to check for collisions (i.e. "non functions")
        checkF rel tuples = case tuples of
            []          -> True
            ((x, y):ts) -> case M.lookup x rel of
                Just y'  -> y' == y && checkF rel ts
                Nothing  -> checkF (M.insert x y rel) ts               

