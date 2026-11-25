module LibTest (unit_fibonacci_10_is_55, prop_each_fibonacci_number_is_the_sum_of_the_two_before_it) where

import Lib
import Relude
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

unit_fibonacci_10_is_55 :: Assertion
unit_fibonacci_10_is_55 = fibonacci 10 @?= 55

prop_each_fibonacci_number_is_the_sum_of_the_two_before_it :: Word8 -> Property
prop_each_fibonacci_number_is_the_sum_of_the_two_before_it n =
  let k = fromIntegral n
   in fibonacci (k + 2) === fibonacci (k + 1) + fibonacci k
