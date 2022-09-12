module View.Speakerdetails exposing (..)

import Components.DataStruct exposing (Speaker, computeCssSpeaker)
import Html exposing (Html, div, h2, img, text)
import Html.Attributes exposing (alt, class, src)


handleSpeaker : Maybe Speaker -> Html msg
handleSpeaker ms =
    case ms of
        Just speaker ->
            div [ class "speaker-details" ]
                [ div [ class "speaker-details-line" ] [ div [ class "speaker-details-name-item" ] [ text speaker.s.name ] ]
                , div [ class "speaker-details-line" ]
                    [ div [ class "speaker-details-title-item" ] [ text "Bio" ]
                    , div [ class "speaker-details-content-item" ] [ text speaker.s.bio ]
                    ]
                , div [ class "speaker-details-picture" ]
                    [ img [ src ("/assets/speakers/" ++ speaker.s.id ++ ".png"), alt speaker.s.name ] [ text speaker.s.name ]
                    ]
                , div [ class "speaker-details-line" ]
                    [ div [ class "speaker-details-title-item" ] [ text "Bio" ]
                    , div [ class "speaker-details-content-item" ] [ text speaker.s.bio ]
                    ]
                , div [ class "speaker-details-line" ]
                    [ div [ class "speaker-details-title-item" ] [ text "Talk" ]
                    , div [ class "speaker-details-content-item" ] [ text speaker.t.description ]
                    ]
                ]

        Nothing ->
            div []
                [ div [ class "flex justify-center" ] [ h2 [] [ text "No speaker found :(" ] ] ]


view : Maybe Speaker -> Html msg
view speaker =
    handleSpeaker speaker
