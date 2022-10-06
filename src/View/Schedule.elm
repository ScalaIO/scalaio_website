module View.Schedule exposing (..)

import Components.DataStruct exposing (GlobalData)
import Components.Utils exposing (transformSpeaker2Talk, transformeScheduleItem)
import Html exposing (Html, a, div, h2, hr, p, span, table, tbody, td, text, tr)
import Html.Attributes as Attr exposing (class, colspan)


view : GlobalData -> Html msg
view gd =
    div [ class "schedule" ]
        [ div [ class "schedule-info" ]
            [ div [] [ text "The conference runs from 9:00 am to 6:30 pm" ]
            ]
        , div [ class "schedule-info" ]
            [ div [] [ text "At 8 am, registration will open and a breakfast will be served." ]
            ]
        , h2 [ class "schedule-program-title" ]
            [ text "ScalaIO 2022 Program" ]
        , p [ class "schedule-program-information" ] [ text "The CFP is closed. " ]
        , p [ class "schedule-program-information" ] [ text "The schedule will be published soon." ]
        , table [ class "schedule-program" ]
            (List.map transformeScheduleItem gd.schedule)
        , hr [] []
        , div [ class "schedule-talks-title" ]
            [ div [] [ text "Talks" ] ]
        , div [ class "schedule-talks-title" ] (transformSpeaker2Talk (List.concat [ gd.speakers.keynote, gd.speakers.talk ]))
        ]
