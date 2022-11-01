module View.Schedule exposing (..)

import Components.DataStruct exposing (BreakKind(..), GlobalData, Lang(..), PresentationKind(..), ScheduleItem(..), ScheduleRow(..))
import Components.Utils exposing (transformSpeaker2Talk)
import Html exposing (Html, div, h2, hr, img, p, span, table, td, text, tr)
import Html.Attributes exposing (class, colspan, src, style)


breakKindToString : BreakKind -> String
breakKindToString kind =
    case kind of
        Lunch ->
            "Lunch Break"

        Coffee ->
            "Coffee Break"

        Registration ->
            "Registration"

        Introduction ->
            "Introduction"

        Empty ->
            ""

        Party ->
            "🎉 Community Party"


presentationKindToString : PresentationKind -> String
presentationKindToString kind =
    case kind of
        Talk ->
            "Talk"

        Short ->
            "Short talk"

        Quickie ->
            "Lightning talk"

        Keynote ->
            "Keynote"


presentationKindToColor : PresentationKind -> String
presentationKindToColor kind =
    case kind of
        Talk ->
            "rgb(191,144,0)"

        Short ->
            "rgb(56,118,29)"

        Quickie ->
            "rgb(204,0,0)"

        Keynote ->
            "rgb(153,0,255)"


renderLang : Lang -> Html msg
renderLang lang =
    case lang of
        EN ->
            img [ src "/assets/icons/united-kingdom.png", class "flag" ] []

        FR ->
            img [ src "/assets/icons/france.png", class "flag" ] []


renderScheduleItem : Int -> ScheduleItem -> Html msg
renderScheduleItem size item =
    case item of
        Presentation data ->
            td [ class "schedule-program-subject-talk", colspan size ]
                [ div [ class "schedule-program-subject-talk-content" ]
                    [ span [ class "schedule-program-subject-talk-title" ] [ renderLang data.lang, text data.title ]
                    , div [ class "schedule-program-subject-talk-information" ]
                        [ p [ class "schedule-program-subject-talk-speaker" ] [ text data.speaker ]
                        , p [ class "schedule-program-subject-talk-kind", style "color" (presentationKindToColor data.kind) ] [ text (presentationKindToString data.kind) ]
                        ]
                    ]
                ]

        Break data ->
            td [ class "schedule-program-subject-item", colspan size ] [ text (breakKindToString data.kind) ]


renderScheduleRow : ScheduleRow -> Html msg
renderScheduleRow row =
    case row of
        Alone data ->
            tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text data.time ]
                , renderScheduleItem 2 data.item
                ]

        Double data ->
            tr [ class "schedule-program-line" ]
                [ td [ class "schedule-program-time-item" ] [ text data.time ]
                , renderScheduleItem 1 data.left
                , renderScheduleItem 1 data.right
                ]


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
        , table [ class "schedule-program" ]
            (List.map renderScheduleRow gd.schedule)
        , hr [] []
        , div [ class "schedule-talks-title" ]
            [ div [] [ text "Talks" ] ]
        , div [ class "talk-content centered-body" ] (transformSpeaker2Talk (List.concat [ gd.speakers.keynote, gd.speakers.talk ]))
        ]
