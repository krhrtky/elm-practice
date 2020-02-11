module Chapter02.Func exposing (..)

{-| 関数定義の方法
    関数名 引数 引数 ... = 式
-}
isNegative n = n < 0

{-|
    再帰関数呼び出し.
-}
sumUntil n =
    sumUntilHelper 0 n

{-|
    再帰関数本体.
-}
sumUntilHelper sum n =
    if n == 0 then
        sum
    else
        sumUntilHelper (sum + n)(n - 1)
