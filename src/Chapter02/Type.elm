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

{-|
  ️ custom type.
-}
type Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

firstDay : Day
firstDay = Mon

type Lang = En | Ja | Fr

hello : Lang -> String
hello lang =
    case lang of
        En -> "Hello"
        Ja -> "こんにちは"
        Fr -> "Bonjour"

--hello En -- "Hello"

type UserAlt
    = LoggedIn Bool String
    | Guest

user1 : UserAlt
user1 = LoggedIn True "Taro"

user2 : UserAlt
user2 = Guest

message : UserAlt -> String
message userType =
    case userType of
        LoggedIn True name ->
            hello En ++ ", " ++ name ++ "(Administrator)."
        LoggedIn False name ->
            hello En ++ ", " ++ name ++ "."
        Guest ->
             "Please Login."


