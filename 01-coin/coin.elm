module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Random
import Tuple exposing (first, second)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { firstCoin : String
    , secondCoin : String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "Heads" "Heads", Cmd.none )



-- UPDATE


type Msg
    = Flip
    | NewFace ( Bool, Bool )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Flip ->
            ( model, Random.generate NewFace (Random.pair Random.bool Random.bool) )

        NewFace newFace ->
            ( Model (getFace (first newFace)) (getFace (second newFace)), Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ p [] [ text ((model.firstCoin) ++ " and " ++ (model.secondCoin)) ]
        , button [ onClick Flip ] [ text "Flip!" ]
        ]


getFace : Bool -> String
getFace bool =
    if bool then
        "Heads"
    else
        "Tails"
