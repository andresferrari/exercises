{-
    The series expansion of e^x is given by: 1 + x + x^2/2! + x^3/3! + x^4/4! + ...
    Evaluate e^x for the given values of x by using the above expansion for the first 10 terms.

    Input Format

        The first line contains an integer N, the number of test cases.
        N lines follow. Each line contains a value of x for which you need to output the value 
        of e^x using the above series expansion. These input values have exactly 4 decimal 
        places each.

    Output Format

        Output N lines, each containing the value of e^x computed by your program.

    Constraints

        1 <= N <= 50
        -20.00 <= x <= 20.00
 
    Var, Val in Scala and def and defn in Clojure are blocked keywords. The challenge is to accomplish this 
    without either mutable state or direct declaration of local variables.
-}

import Control.Monad (replicateM)
import Data.Functor ((<$>))

main :: IO ()
main = do
    n <- readLn :: IO Int
    xs <- replicateM n $ read <$> getLine
    mapM_ (print . evaluateE 10) xs
    
evaluateE :: Int -> Double -> Double
evaluateE t x = sum $ take t $ seriesE 1.0 1 1 
    where
        seriesE :: Double -> Integer -> Integer -> [Double]
        seriesE n d f = e' : seriesE n' d' (f + 1)
            where
                e' = n / fromIntegral d
                n' = n * x
                d' = d * f
