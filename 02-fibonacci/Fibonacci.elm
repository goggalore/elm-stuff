module Fibonacci exposing (..)


fibonacci : Int -> Int
fibonacci index =
    if index == 0 then
        0
    else if index == 1 then
        1
    else
        (fibonacci (index - 1)) + (fibonacci (index - 2))



-- the following returns a list that has all terms up to index provided


fibonacciList : Int -> List Int
fibonacciList index =
    if index == 0 then
        []
    else
        (fibonacci (index - 1)) :: (fibonacciList (index - 1))
