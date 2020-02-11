module Chapter02.Func exposing (..)

{-| 関数定義の方法
    関数名 引数 引数 ... = 式
-}
isNegative n = n < 0

{-|
    再帰関数.
-}
sumUntil : Int -> Int
sumUntil n =
    if n == 1 then
        1
    else
        n + sumUntil (n - 1)
