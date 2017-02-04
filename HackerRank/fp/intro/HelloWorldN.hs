{-
    Print "Hello World" N amount of times. The input portion will be handled automatically. You need to write a function 
    with the recommended method signature.

    Input Format:

        A single line of input containing integer N, the number of times to print "Hello World".

    Output Format:

        Output N lines, each containing "Hello World".
-}

import Control.Monad (replicateM_)

-- This part is related to the Input/Output and can be used as it is
-- Do not modify it
main = do
   n <- readLn :: IO Int
   helloWorlds n
   
helloWorlds :: Int -> IO ()
--helloWorlds n = mapM_ putStrLn $ replicate n "Hello World"
helloWorlds n = replicateM_ n $ putStrLn "Hello World"

