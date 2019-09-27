module SDL.Raw.PrimitiveSpec where

import SpecUtils

import Foreign.Marshal.Alloc (alloca)
import Data.Functor (void)
  
import SDL.Raw.Primitive

spec :: Spec
spec = do
  describe "pixel" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ pixel renderer 1 2 3 4 5 6
  describe "hline" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ hline renderer 1 2 3 4 5 6 7
  describe "vline" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ vline renderer 1 2 3 4 5 6 7
  describe "rectangle" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ rectangle renderer 1 2 3 4 5 6 7 8
  describe "roundedRectangle" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ roundedRectangle renderer 1 2 3 4 5 6 7 8 9
  describe "box" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ box renderer 1 2 3 4 5 6 7 8
  describe "roundedBox" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ roundedBox renderer 1 2 3 4 5 6 7 8 9
  describe "line" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ line renderer 1 2 3 4 5 6 7 8
  describe "aaLine" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ aaLine renderer 1 2 3 4 5 6 7 8
  describe "thickLine" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ thickLine renderer 1 2 3 4 5 6 7 8 9
  describe "circle" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ circle renderer 1 2 3 4 5 6 7
  describe "arc" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ arc renderer 1 2 3 4 5 6 7 8 9
  describe "aaCircle" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ aaCircle renderer 1 2 3 4 5 6 7
  describe "filledCircle" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ filledCircle renderer 1 2 3 4 5 6 7
  describe "ellipse" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ ellipse renderer 1 2 3 4 5 6 7 8
  describe "aaEllipse" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ aaEllipse renderer 1 2 3 4 5 6 7 8
  describe "filledEllipse" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ filledEllipse renderer 1 2 3 4 5 6 7 8
  describe "pie" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ pie renderer 1 2 3 4 5 6 7 8 9
  describe "filledPie" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ filledPie renderer 1 2 3 4 5 6 7 8 9
  describe "trigon" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ trigon renderer 1 2 3 4 5 6 7 8 9 10
  describe "aaTrigon" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ aaTrigon renderer 1 2 3 4 5 6 7 8 9 10
  describe "filledTrigon" $
    it "links" $ withSomeRenderer $ \renderer ->
      void $ filledTrigon renderer 1 2 3 4 5 6 7 8 9 10
  describe "polygon" $
    it "links" $ withSomeRenderer $ \renderer -> alloca $ \x ->
      void $ polygon renderer x x 1 2 3 4 5
  describe "aaPolygon" $
    it "links" $ withSomeRenderer $ \renderer -> alloca $ \x ->
      void $ aaPolygon renderer x x 1 2 3 4 5
  describe "filledPolygon" $
    it "links" $ withSomeRenderer $ \renderer -> alloca $ \x ->
      void $ filledPolygon renderer x x 1 2 3 4 5
  describe "texturedPolygon" $
    it "links" $ withSomeRenderer $ \renderer -> alloca $ \x -> withSomeSurface $ \s -> 
      void $ texturedPolygon renderer x x 1 s 2 3
  describe "bezier" $
    it "links" $ withSomeRenderer $ \renderer -> alloca $ \x ->
      void $ bezier renderer x x 1 2 3 4 5 6
