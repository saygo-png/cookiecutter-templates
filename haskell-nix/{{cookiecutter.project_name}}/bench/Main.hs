module Main (main) where

import Lib
import Relude
import Test.Tasty.Bench

main :: IO ()
main =
  defaultMain
    [ bench "fibonacci 1000" $ nf fibonacci 1000
    ]
