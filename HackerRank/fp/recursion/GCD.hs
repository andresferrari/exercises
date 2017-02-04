{-
    Given two integers, X and Y, find their GCD using the recursive Euclidean Algorithm.
    
    The algorithm states that, for computing the GCD of two positive integers X and Y, if X == Y, GCD(X, Y) = X. 
    Otherwise GCD(X, Y) = GCD(X - Y, Y) if X > Y. There are a few optimizations that can be made to the above logic to 
    arrive at a more efficient implementation.
    
    Input Format

        One line of input containing 2 space separated integers.

    Constraints

        1 <= X, Y <= 10^6
-}

gcd' :: Integral a => a -> a -> a
{- Naive
gcd' x y 
    | x == y    = x
    | x < y     = gcd (x - y) y 
    | otherwise = gcd y x
-}
{- Improved
gcd' x y
    | x == 0 || y == 0 = max x y
    | x > y            = gcd (x `mod` y) y
    | otherwise        = gcd x (y `mod` x)
-}
-- Even faster! (as suggested by http://people.cs.ksu.edu/~schmidt/301s12/Exercises/euclid_alg.html)
gcd' x y
    | x < y     = gcd' y x
    | y /= 0    = let r = x `mod` y in gcd' y r
    | otherwise = x 

-- This part is related to the Input/Output and can be used as it is
-- Do not modify it
main :: IO ()
main = do
    input <- getLine
    print . uncurry gcd' . listToTuple . convertToInt . words $ input
        where
            listToTuple (x:xs:_) = (x, xs)
            listToTuple _        = error "Invalid input"
            convertToInt         = map (read :: String -> Int)

