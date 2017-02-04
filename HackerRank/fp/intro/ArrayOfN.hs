{-
    Create an array of N integers. 
    
    The value of the elements doesn't matter. For example, if N=4, you could return [1,1,1,1], [1,2,3,4], or any other 
    array of length 4.
-}

main :: IO ()
main = do
    n <- readLn :: IO Int
    print $ f n
    
-- Using the Prelude, this could be implemented as f n = replicate n 1 
f :: Int -> [Int]
f n = if n == 0 then [] else n : f (n - 1)

