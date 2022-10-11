module View.Workshops exposing (..)

import Components.DataStruct exposing (GlobalData)
import Components.Utils exposing (transformSpeaker2Talk, transformWorkshop, transformeScheduleItem)
import Html exposing (Html, div, h2, hr, p, table, text)
import Html.Attributes exposing (class)


view : GlobalData -> Html msg
view gd =
    div [ class "workshop" ]
        [ h2 [ class "workshop-program-title" ]
            [ text "Workshop 2022 Program" ]
        , div [ class "workshop-info" ]
            [ div [] [ text (String.append "Workshop venue address : " gd.ws.address) ]
            ]
        , div [ class "workshop-info" ]
            [ div [] [ text (String.append "Workshop schedule : " gd.ws.horaires) ]
            ]
        , div [ class "workshop-info workshop-info-warning" ]
            [ div [] [ text "Workshop ticket included pass conference. It can be buy from our ticketing" ]
            ]
        , div [ class "workshop-content" ] (transformWorkshop gd.ws.workshops)
        ]
