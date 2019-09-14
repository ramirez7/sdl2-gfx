module SDL.Raw.RotozoomSpec where

import SpecUtils

import qualified SDL.Raw as SDL
import Foreign.Marshal.Alloc (alloca)

import SDL.Raw.Rotozoom

spec :: Spec
spec = do
  describe "rotozoom" $
    it "links" $ withSurface 1 2 3 4 5 6 7 8 $ \surface ->
      rotozoom surface 1.1 2.2 3 >>= SDL.freeSurface
  describe "rotozoomXY" $
    it "links" $ withSurface 1 2 3 4 5 6 7 8 $ \surface ->
      rotozoomXY surface 1.1 2.2 3.3 4 >>= SDL.freeSurface
  describe "rotozoomSize" $
    it "links" $ alloca $ \iptr -> rotozoomSize 1 2 3.3 4.4 iptr iptr
  describe "rotozoomSizeXY" $
    it "links" $ alloca $ \iptr -> rotozoomSizeXY 1 2 3.3 4.4 5.5 iptr iptr
  describe "zoom" $
    it "links" $ withSurface 1 2 3 4 5 6 7 8 $ \surface ->
      zoom surface 1.1 2.2 3 >>= SDL.freeSurface
  describe "zoomSize" $
    it "links" $ alloca $ \iptr -> zoomSize 1 2 3.3 4.4 iptr iptr
  describe "shrink" $
    it "links" $ withSurface 1 2 3 4 5 6 7 8 $ \surface ->
      shrink surface 2 3 >>= SDL.freeSurface
  describe "rotate90" $
    it "links" $ withSurface 1 2 3 4 5 6 7 8 $ \surface ->
      rotate90 surface 1 >>= SDL.freeSurface
