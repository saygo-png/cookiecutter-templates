module Lib (fibonacci) where

import Relude

fibonacci :: Natural -> Natural
fibonacci = go 0 1
  where
    go a _ 0 = a
    go a b n = go b (a + b) (n - 1)
