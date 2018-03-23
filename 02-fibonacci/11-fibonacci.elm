module Main exposing (..)

import Html exposing (Html, div, text, p, h1, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import List exposing (map, indexedMap)
import Fibonacci exposing (..)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    { index : Int
    }


init : ( Model, Cmd Msg )
init =
    ( Model 0, Cmd.none )



-- UPDATE


type Msg
    = Increment


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | index = model.index + 1 }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Fibonacci Number Generator" ]
        , button [ onClick Increment ] [ text "Compute next term" ]
        , newView model
        ]



-- ADDING NUMBERS TO VIEW


newView : Model -> Html Msg
newView model =
    let
        paragraphs =
            map (\terms -> p [] [ text terms ])
                (indexedMap
                    (\index term ->
                        "Term "
                            ++ toString (model.index - index)
                            ++ ": "
                            ++ toString term
                    )
                    (fibonacciList model.index)
                )
    in
        div [] paragraphs
