{-
    Reverse a list.
-}
    
rev :: [a] -> [a]    
rev xs = helper xs [] -- alternatively: foldl (flip (:)) [] xs

helper :: [a] -> [a] -> [a]
helper xs ys = case xs of
    []     -> ys
    (z:zs) -> helper zs (z:ys)

