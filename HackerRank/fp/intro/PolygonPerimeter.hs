{-
    You are given the cartesian coordinates of a set of points in a 2D plane. When traversed sequentially, these points 
    form a polygon P, which is not self-intersecting in nature. Compute the perimeter of P.

    Input Format

        The first line contains an integer N, denoting the number of points. 
        The N subsequent lines each contain 2 space-separated integers denoting the respective (x, y) coordinates of a 
        point.

    Constraints

        No 2 points are coincident, and polygon P is obtained by traversing the points in a clockwise direction.
        3 <= N <= 1000
        0 <= x, y <= 1000
        
    Output Format

        For each test case, print the perimeter of P (correct to a scale of one decimal place).
-}

main :: IO ()
main = getContents >>= (print . perimeter . parsePolygon)

parsePolygon :: String -> [(Double, Double)]
parsePolygon input = map ((\x -> (read $ head x, read $ last x)) . words) $ tail $ lines input

-- Precondition: at least 3 points
perimeter :: [(Double, Double)] -> Double
perimeter pts = res + dist pN p0
    where
        (p0 : ps) = pts 
        (res, pN)  = perim ps p0 0.0
        perim ps' prev acc = case ps' of
            (h : t) -> perim t h (acc + dist prev h) 
            _       -> (acc, prev)
        dist (x0, y0) (x1, y1) = let (dx, dy) = (x0 - x1, y0 - y1) in sqrt (dx*dx + dy*dy)

