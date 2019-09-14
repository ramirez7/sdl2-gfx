module SpecUtils (module SpecUtils, module X) where

import Test.Hspec as X

p :: String -> IO ()
p s = putStrLn $ "\x1b[32m" ++ s ++ "\x1b[0m"

(.:) :: a -> b -> (a, b)
a .: b = (a, b)
