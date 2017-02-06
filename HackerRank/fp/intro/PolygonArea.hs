{-
    You are given the cartesian coordinates of a set of points in a 2D plane. When traversed sequentially, these points 
    form a polygon P, which is not self-intersecting in nature. Compute the area of P.

    Input Format

        The first line contains an integer N, denoting the number of points. 
        The N subsequent lines each contain 2 space-separated integers denoting the respective (x, y) coordinates of a 
        point.

    Constraints

        No 2 points are coincident, and polygon P is obtained by traversing the points in counter-clockwise direction.
        4 <= N <= 1000
        0 <= x, y <= 1000
        
    Output Format

        For each test case, print the perimeter of P (correct to a scale of one decimal place).
        Do not add any leading/trailing spaces or units; it is assumed that your result is in square units.
-}

import Data.List (foldl')

main :: IO ()
main = getContents >>= (print . area . parsePolygon)

parsePolygon :: String -> [(Double, Double)]
parsePolygon input = map ((\x -> (read $ head x, read $ last x)) . words) $ tail $ lines input

-- Formula for simple polygons from https://en.wikipedia.org/wiki/Polygon#Simple_polygons
area :: [(Double, Double)] -> Double
area ps = abs $ 0.5 * foldl' (\s ((x0, y0), (x1, y1)) -> s + (x0*y0 - x1*y1)) 0.0 xys
    where
        xys = zip xs' ys'
        xs' = zip xs (tail ys ++ [head ys])
        ys' = zip (tail xs ++ [head xs]) ys 
        xs  = map fst ps
        ys  = map snd ps

