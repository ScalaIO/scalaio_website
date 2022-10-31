module Components.Utils exposing (capitalize, transformSpeaker, transformSpeaker2Talk, transformSponsor, transformWorkshop)

import Components.DataStruct exposing (Lang(..), PresentationKind, ScheduleItem, Speaker, Sponsor, SponsorKind, Workshop, computeCssSpeaker, computeCssSponsor)
import Html exposing (Html, a, div, h2, img, p, span, text)
import Html.Attributes as Attr exposing (alt, class, src, style)
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


speakerFormat : PresentationKind -> Speaker -> Html msg
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
        [ h2 [ class "talk-item-title" ]
            [ text s.s.title
            , span [ class "talk-item-speaker" ]
                [ a [ Attr.href ("/speaker-details/" ++ s.s.id) ] [ text s.s.name ] ]
            ]
        , div [ class "talk-item-abstract" ] [ text s.t.abstract ]
        ]


transformSpeaker2Talk : List Speaker -> List (Html msg)
transformSpeaker2Talk ls =
    List.map talkFormat ls


transformSpeaker : List Speaker -> PresentationKind -> List (Html msg)
transformSpeaker data k =
    List.map (speakerFormat k) data


toParagraph : String -> Html msg
toParagraph content =
    p [] [ text content ]


workshopDescriptionFormatting : String -> List (Html msg)
workshopDescriptionFormatting description =
    String.split "\n" description |> List.map toParagraph


workshopFormat : Workshop -> Html msg
workshopFormat s =
    div [ class "workshop-item" ]
        [ div [ class "workshop-item-trainer" ]
            [ div [ class "workshop-item-photo", style "background-image" ("url(\"/assets/speakers/" ++ s.photo ++ ".png\")") ] [ text "" ]
            , span [ class "workshop-item-name" ] [ text s.trainer ]
            ]
        , div []
            [ h2 [ class "workshop-item-title" ] [ text s.title, span [ class "workshop-item-nb-places workshop-item-title-info" ] [ text s.lang ] ]
            , div [] [ text "Formation : ", a [ class "workshop-item-link", Attr.href s.link, Attr.target "_blank" ] [ text s.link ] ]
            , div [ class "workshop-item-description" ] (workshopDescriptionFormatting s.description)
            ]
        ]


transformWorkshop : List Workshop -> List (Html msg)
transformWorkshop ls =
    List.map workshopFormat ls
