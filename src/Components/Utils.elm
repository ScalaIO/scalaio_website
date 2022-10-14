module Components.Utils exposing (capitalize, transformSpeaker, transformSpeaker2Talk, transformSponsor, transformWorkshop, transformeScheduleItem)

import Components.DataStruct exposing (KindTalk, Schedule, ScheduleItem, Speaker, Sponsor, SponsorKind, Type(..), Workshop, computeCssSpeaker, computeCssSponsor)
import Html exposing (Html, a, div, h2, img, p, span, td, text, tr)
import Html.Attributes as Attr exposing (alt, class, colspan, rowspan, src, style)
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
        [ h2 [ class "talk-item-title" ]
            [ text s.s.title
            , span [ class "talk-item-speaker" ] [ a [ Attr.href ("/speaker-details/" ++ s.s.id) ] [ text s.s.name ] ]
            ]
        , div [ class "talk-item-abstract" ] [ text s.t.abstract ]
        ]


transformSpeaker2Talk : List Speaker -> List (Html msg)
transformSpeaker2Talk ls =
    List.map talkFormat ls


transformSpeaker : List Speaker -> KindTalk -> List (Html msg)
transformSpeaker data k =
    List.map (speakerFormat k) data


transformeScheduleItem : ScheduleItem -> Html msg
transformeScheduleItem si =
    case si.typ of
        Single ->
            tr [ class "schedule-program-line" ]
                (List.concat
                    [ [ td [ class "schedule-program-time-item" ] [ text si.time ] ]
                    , List.map (\i -> td [ class "schedule-program-subject-item", colspan 2 ] [ text i ]) si.items
                    ]
                )

        Double ->
            tr [ class "schedule-program-line" ]
                (List.concat
                    [ [ td [ class "schedule-program-time-item" ] [ text si.time ] ]
                    , List.map (\i -> td [ class "schedule-program-subject-talk" ] [ text i ]) si.items
                    ]
                )

        Lunch ->
            tr [ class "schedule-program-line" ]
                (List.concat
                    [ [ td [ class "schedule-program-time-item" ] [ text si.time ] ]
                    , List.map (\i -> td [ class "schedule-program-subject-item", colspan 2 ] [ text i ]) si.items
                    ]
                )

        AfterLunch ->
            tr [ class "schedule-program-line" ]
                (List.concat
                    [ [ td [ class "schedule-program-time-item" ] [ text si.time ] ]
                    , List.map (\i -> td [ class "schedule-program-subject-talk" ] [ text i ]) si.items
                    , [ td [ class "schedule-program-subject-launch" ] [] ]
                    ]
                )


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
            , div [ class "workshop-item-description" ] (workshopDescriptionFormatting s.description)
            ]
        ]


transformWorkshop : List Workshop -> List (Html msg)
transformWorkshop ls =
    List.map workshopFormat ls
