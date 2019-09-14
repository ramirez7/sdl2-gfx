{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE TypeApplications      #-}

module SDL.Raw.ImageFilterSpec where

import           Prelude               hiding (div)

import           SpecUtils

import           SDL.Raw.ImageFilter

import           Data.Foldable         (for_)
import           Foreign.C.Types
import           Foreign.Marshal.Alloc (alloca)

spec :: Spec
spec = do
  describe "mmxDetect" $
    it "links" $ do
      x <- mmxDetect @IO
      p $ "mmxDetect = " ++ show x
  describe "mmxOff" $
    it "links" $ do
      mmxOff @IO
  describe "mmxOn" $
    it "links" $ do
      mmxOn @IO
  for_ [ "add" .: add, "mean" .: mean, "sub" .: sub, "absDiff" .: absDiff, "mult" .: mult
       , "multNor" .: multNor, "multDivBy2" .: multDivBy2, "multDivBy4" .: multDivBy4
       , "bitAnd" .: bitAnd, "bitOr" .: bitOr, "div" .: div] $ \(name, f) ->
    describe name $
      it "links" $
        alloca $ \cptr -> do
          x <- f cptr cptr cptr 2 :: IO CInt
          p $ name ++ " = " ++ show x
  describe "bitNegation" $
    it "links" $ do
      alloca $ \cptr -> do
        x <- bitNegation cptr cptr 2
        p $ "bitNegation = " ++ show x
  for_ [ "addByte" .: addByte, "addByteToHalf" .: addByteToHalf, "subByte" .: subByte
       , "shiftRight" .: shiftRight, "shiftRightUInt" .: shiftRightUInt
       , "multByByte" .: multByByte, "shiftLeftByte" .: shiftLeftByte
       , "shiftLeftUInt" .: shiftLeftUInt, "shiftLeft" .: shiftLeft
       , "binarizeUsingThreshold" .: binarizeUsingThreshold] $ \(name, f) ->
    describe name $
      it "links" $
        alloca $ \cptr -> do
          x <- f cptr cptr 2 3
          p $ name ++ " = " ++ show x
  for_ [ "addUInt" .: addUInt, "subUInt" .: subUInt] $ \(name, f) ->
    describe name $
      it "links" $
        alloca $ \cptr -> do
          x <- f cptr cptr 2 3
          p $ name ++ " = " ++ show x
  for_ [ "shiftRightAndMultByByte" .: shiftRightAndMultByByte
       , "clipToRange" .: clipToRange] $ \(name, f) ->
    describe name $
      it "links" $
        alloca $ \cptr -> do
          x <- f cptr cptr 2 3 4
          p $ name ++ " = " ++ show x
  describe "normalizeLinear" $
    it "links" $
      alloca $ \cptr -> do
        x <- normalizeLinear cptr cptr 2 3 4 5 6
        p $ "normalizeLinear = " ++ show x
