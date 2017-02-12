{-
    Given a lowercase string consisting of N characters a-z, remove all characters that occurred previously 
    in the string. 
    
    Formally, remove all characters s(i) such that
    
        Exists j, s(j) = s(i) and j < i 
    
    Input Format
    
        The strings to reduce.
        
    Constraints
    
        1 <= N <= 10^5
        All characters belong to { a, b, ... z }
        
    Output Format
        
        The reduced string.
-}

import Data.Set (member, insert)
import qualified Data.Set as Set

main :: IO ()
main = getLine >>= putStrLn . reduce

-- Could be solved by the Prelude function nub :: Eq a => [a] -> [a]
reduce :: Ord a => [a] -> [a]
reduce = reverse . snd . foldr f (Set.empty, []) . reverse
    where
        f c (seen, res) = if c `member` seen then (seen, res) else (insert c seen, c:res) 

