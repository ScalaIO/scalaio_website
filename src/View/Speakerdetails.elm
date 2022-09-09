module View.Speakerdetails exposing (..)


import Components.DataStruct exposing (GlobalData, Speaker)
import Html exposing (Html, div, h2, text)
import Html.Attributes exposing (class)
view : Speaker -> Html msg
view gd =
    div [  ]
        [ div [ class "flex justify-center" ] [ h2 [] [ text "Keynote" ] ]
        , div [ class "flex justify-center" ] [ h2 [] [ text "Talks" ] ]

        ]