module View.Workshops exposing (..)

import Components.DataStruct exposing (GlobalData)
import Components.Utils exposing (transformWorkshop)
import Html exposing (Html, a, div, h2, text)
import Html.Attributes as Attr exposing (class)


view : GlobalData -> Html msg
view gd =
    div [ class "centered-body" ]
        [ h2 [ class "workshop-program-title" ]
            [ text "Workshop 2022 Program" ]
        , div [ class "workshop-info" ]
            [ div [] [ text (String.append "Workshop venue address : " gd.ws.address) ] ]
        , div [ class "workshop-info" ]
            [ div [] [ text (String.append "Workshop schedule : " gd.ws.horaires) ]
            ]
        , div [ class "workshop-info workshop-info-warning" ]
            [ div [] [ text "Workshop ticket included pass conference. It can be buy from our ",
             a [ Attr.href "/" ] [ text "ticketing" ]]
            ]
        , div [ class "workshop-content" ] (transformWorkshop gd.ws.workshops)
        ]
