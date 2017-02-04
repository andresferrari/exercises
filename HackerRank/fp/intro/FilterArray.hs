{-
    Filter a given array of integers and output only those values that are less than a specified value X. The output 
    integers should be in the same sequence as they were in the input.

    Do not use the built-in filter function.

    Input Format

        The first line contains the delimiter X. 
        The next B lines each contain an integer, which represents the elements of the list/array. You have to read the 
        input until EOF.

    Output Format

        Print all the integers from the array that are less than the given upper limit X on separate lines. The sequence
        should be the same as it was in the original array.

    Constraints

        1 <= B <= 100
        For any Y in the array, -100 <= Y <= 100
        -100 <= X <= 100
-}

main :: IO ()
main = do 
    n <- readLn :: IO Int 
    inputdata <- getContents 
    let 
        numbers = map read (lines inputdata) :: [Int] 
    putStrLn . unlines $ (map show . f n) numbers

f :: Int -> [Int] -> [Int]
f = better

-- Compact version
better :: Int -> [Int] -> [Int]
better n = foldr (\x acc -> if x < n then x : acc else acc) []

-- Naive version
naive :: Int -> [Int] -> [Int]
naive n xs = case xs of
    []     -> []
    (y:ys) -> if y < n then y: naive n ys else naive n ys

