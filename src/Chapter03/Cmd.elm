module Chapter03.Cmd exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Http

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }

-- MODEL

type alias Model =
    { result : String
    }

init : () -> ( Model, Cmd Msg)
init _ =
    ( { result = "" }
    , Cmd.none
    )

-- UPDATE

type Msg
    = Click
    | GotRepo (Result Http.Error String)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Click ->
            ( model
            -- リクエストを発行
            , Http.get
                { url = "https://api.github.com/repos/elm/core"
                , expect = Http.expectString GotRepo
                }
            )
        -- 成功したとき
        GotRepo (Ok repo) ->
            ( { model | result = repo }, Cmd.none )
        -- 失敗したとき
        GotRepo (Err error) ->
            ( { model | result = Debug.toString error }, Cmd.none )

-- VIEW

view :  Model -> Html Msg
view mode =
    div []
        [ button [ onClick Click ] [text "Get Repository Info" ]
        , p [] [ text mode.result ]
        ]
