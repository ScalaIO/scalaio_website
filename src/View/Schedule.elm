module View.Schedule exposing (..)

import Components.DataStruct exposing (GlobalData)
import Html exposing (Html, a, div, h2, p, span, table, tbody, td, text, tr)
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
        , p [ class "schedule-program-information" ] [ text "The CFP is still opened. ", a [ Attr.href "https://www.papercall.io/scalaio2022", Attr.target "_blank" ] [ text "(here)" ] ]
        , p [ class "schedule-program-information" ] [ text "The schedule will be published later." ]
        , table [ class "schedule-program" ]
            [ tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text "08:00 - 09:00" ]
                , td [ class "schedule-program-subject-item", colspan 2 ] [ text "Registration" ]
                ]
            , tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text "09:00 - 09:20" ]
                , td [ class "schedule-program-subject-item", colspan 2 ] [ text "Introduction" ]
                ]
            , tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text "09:25 - 10:20" ]
                , td [ class "schedule-program-subject-item", colspan 2 ] [ text "Keynote" ]
                ]
            , tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text "10:30 - 11:25" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                ]
            , tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text "11:30 - 12:30" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                ]
            , tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text "12:25 - 14:00" ]
                , td [ class "schedule-program-subject-item", colspan 2 ] [ text "Lunch break" ]
                ]
            , tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text "14:00 - 14:55" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                ]
            , tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text "15:00 - 16:00" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                ]
            , tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text "16:00 - 16:30" ]
                , td [ class "schedule-program-subject-item", colspan 2 ] [ text "Coffee break" ]
                ]
            , tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text "16:30 - 17:25" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                ]
            , tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text "17:30 - 18:30" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                , td [ class "schedule-program-subject-talk" ] [ text "Talk" ]
                ]
            ]
        ]
