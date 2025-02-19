{-# LANGUAGE ScopedTypeVariables #-}
module Expo where

import Numeric.Natural

expo :: Natural -> Natural -> Natural
expo b 0 = 1
expo b n 
    | even n     = expo (square b) (n `div` 2)
    | otherwise = b * expo b (n-1)  
    
expo' :: Natural -> Natural -> Natural
expo' b n = iter 1 b n
    where
        iter :: Natural -> Natural -> Natural -> Natural
        iter a b 0 = a
        iter a b n
            | even n    = iter a (square b) (n `div` 2)
            | otherwise = iter (a * b) b (pred n)

square :: Natural -> Natural
square x = x * x

{-
素朴なべき乗は、時間計算量は、 0(n)
逐次平方なべき乗は、時間計算量は、 0(log n)
-}