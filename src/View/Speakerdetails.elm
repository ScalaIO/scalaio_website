module View.Speakerdetails exposing (..)

import Components.DataStruct exposing (Speaker, computeCssSpeaker)
import Html exposing (Html, a, div, h2, img, text)
import Html.Attributes as Attr exposing (alt, class, src)


handleSpeaker : Maybe Speaker -> Html msg
handleSpeaker ms =
    case ms of
        Just speaker ->
            div [ class "speaker-details" ]
                [ div [ class "speaker-details-name-item" ] [ text (speaker.s.name ++ " - " ++ speaker.s.organization) ]
                , div [ class "speaker-details-info" ]
                    [ div [ class "speaker-details-picture" ]
                        [ img [ src ("/assets/speakers/" ++ speaker.s.id ++ ".png"), alt speaker.s.name ] [ text speaker.s.name ] ]
                    , div [ class "speaker-details-content-item" ] [ text speaker.s.bio ]
                    ]
                , div [ class "speaker-details-title" ] [ text "Talk" ]
                , div [ class "speaker-details-talk" ]
                    [ div [ class "speaker-details-talk-title" ] [ text speaker.s.title ]
                    , div [ class "speaker-details-talk-info" ] [ text (speaker.t.talk_format ++ " | " ++ speaker.t.audience_level) ]
                    , div [ class "speaker-details-talk-content-item" ] [ text speaker.t.description ]
                    , div [ class "speaker-details-talk-content-item" ]
                        [ a [ Attr.href "/schedule", class "flex justify-center" ]
                            [ text "Schedule" ]
                        , div [] [ text " | " ]
                        , a [ Attr.href "/speakers", class "flex justify-center" ]
                            [ text "Speakers" ]
                        ]
                    ]
                ]

        Nothing ->
            div []
                [ div [ class "flex justify-center" ] [ h2 [] [ text "No speaker found :(" ] ] ]


view : Maybe Speaker -> Html msg
view speaker =
    handleSpeaker speaker
