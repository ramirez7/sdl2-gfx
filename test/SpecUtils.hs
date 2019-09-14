module SpecUtils (module SpecUtils, module X) where

import Test.Hspec as X

import SDL.Raw as SDL
import Foreign.C.Types
import Foreign.Ptr
import Data.Word
import Control.Exception (bracket)

p :: String -> IO ()
p s = putStrLn $ "\x1b[32m" ++ s ++ "\x1b[0m"

(.:) :: a -> b -> (a, b)
a .: b = (a, b)

withSurface :: Word32 -> CInt -> CInt -> CInt -> Word32 -> Word32 -> Word32 -> Word32 -> (Ptr Surface -> IO a) -> IO a
withSurface v1 v2 v3 v4 v5 v6 v7 v8 =
  bracket (createRGBSurface v1 v2 v3 v4 v5 v6 v7 v8) freeSurface
