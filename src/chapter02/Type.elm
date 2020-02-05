module Type exposing (..)

{-|
    Type Annotation.
-}
output : String
output = "1 + 1 = " ++ String.fromInt(add 1 1)

{-|
    Type Alias(record).
-}
type  alias User =
    { id: Int
    , name : String
    , image : String
    }

-- init Type.
user : User
user = User 1 "Taro" "1.png"

{-|
    Type Alias(value).
    🙅‍‍️ { id = 1, title = "Introduction" }
-}
type alias UserId = Int

{-|
    Record with any parameters.
    🙆‍️ { id = 1, title = "Introduction" }
-}
type alias HasId a =
    { a | id : UserId }

{-|
  ️ { id : Int, title = String }
-}
type alias Article =
    HasId { title : String }
