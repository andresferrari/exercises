{-
    Count the number of elements in a list without using count, size or length operators (or their equivalents).
-}

import Data.List (foldl')

len :: [a] -> Int
len = foldl' (\acc _ -> 1 + acc) 0

