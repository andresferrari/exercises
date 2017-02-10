{-
    Output the Nth term of the Fibonacci series.
    
    Input Format

        One line of input, the integer N.

    Constraints

        0 < N <= 40

    Output Format
    
        The Nth Fibonacci number.        
-}

main :: IO ()
main = do
    n <- readLn :: IO Int
    print $ fib n
    
fib :: Int -> Int
fib n
    | n == 0    = error "Index out of bounds"
    | n == 1    = 0
    | n == 2    = 1
    | otherwise = fib' 0 1 n
        where
            fib' f1 f2 k
                | k == 2    = f1 + f2
                | otherwise = fib' (f1 + f2) f1 (k - 1) 

-- Naive, inefficient version
{-
fib n
    | n == 0    = error "Index out of bounds"
    | n == 1    = 0
    | n == 2    = 1
    | otherwise = (fib $ n - 1) + (fib $ n - 2)
-}

