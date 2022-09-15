module Components.Utils exposing (capitalize, transformSpeaker, transformSpeaker2Talk, transformSponsor)

import Components.DataStruct exposing (KindTalk, Speaker, Sponsor, SponsorKind, computeCssSpeaker, computeCssSponsor)
import Html exposing (Html, a, div, img, span, text)
import Html.Attributes as Attr exposing (alt, class, src)
import String exposing (..)


capitalize : String -> String
capitalize str =
    (left 1 >> toUpper) str ++ dropLeft 1 str


sponsorToUrl : SponsorKind -> Sponsor -> Html msg
sponsorToUrl k s =
    a [ Attr.href s.url, Attr.target "_blank", class "flex justify-center" ] [ img [ src ("/assets/sponsors/logo-" ++ s.name ++ ".png"), alt s.name, class (computeCssSponsor k) ] [] ]


transformSponsor : List Sponsor -> SponsorKind -> List (Html msg)
transformSponsor data k =
    List.map (sponsorToUrl k) data


speakerFormat : KindTalk -> Speaker -> Html msg
speakerFormat k s =
    div [ class "speakers-display" ]
        [ div []
            [ a [ Attr.href ("/speaker-details/" ++ s.s.id), class "flex justify-center" ]
                [ img [ src ("/assets/speakers/" ++ s.s.id ++ ".png"), alt s.s.name, class (computeCssSpeaker k) ] [ text s.s.name ] ]
            ]
        , div [ class "speakers-display-name" ] [ text s.s.name ]
        , div [ class "speakers-display-title" ] [ text s.s.speakerTitle ]
        ]


talkFormat : Speaker -> Html msg
talkFormat s =
    div [ class "talk-item" ]
        [ div [ class "talk-item-title" ]
            [ div [] [  text s.s.title ],
             div [ class "talk-item-speaker" ] [ a [ Attr.href ("/speaker-details/" ++ s.s.id) ] [text s.s.name ]]
            ]
        , div [class "talk-item-abstract"][text s.t.abstract]
        ]


transformSpeaker2Talk : List Speaker -> List (Html msg)
transformSpeaker2Talk ls =
    List.map talkFormat ls


transformSpeaker : List Speaker -> KindTalk -> List (Html msg)
transformSpeaker data k =
    List.map (speakerFormat k) data
