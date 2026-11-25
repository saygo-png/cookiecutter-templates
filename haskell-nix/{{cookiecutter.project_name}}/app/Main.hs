module Main (main) where

import Lib
import Relude

main :: IO ()
main = putTextLn $ "fibonacci 30 = " <> show (fibonacci 30)
