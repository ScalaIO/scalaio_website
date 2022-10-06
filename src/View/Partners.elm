module View.Partners exposing (view)

import Components.DataStruct as SponsorKind exposing (GlobalData, SponsorKind)
import Components.Utils exposing (transformSponsor)
import Html exposing (Html, div, h2, text)
import Html.Attributes as Attr exposing (class)


view : GlobalData -> Html msg
view gd =
    div [ Attr.class "centered-body partners" ]
        [ div []
            [ div [ Attr.class "centered-body-title" ] [ h2 [] [ text "Platinum Sponsor" ] ]
            , div [ class "partners-logo" ] (transformSponsor gd.sponsors.platine SponsorKind.Platine)
            ]
        , div []
            [ div [ Attr.class "centered-body-title" ] [ h2 [] [ text "Gold Sponsor" ] ]
            , div [ class "partners-logo" ] (transformSponsor gd.sponsors.gold SponsorKind.Gold)
            ]
        , div []
            [ div [ Attr.class "centered-body-title" ] [ h2 [] [ text "Community Sponsor" ] ]
            , div [ class "partners-logo" ] (transformSponsor gd.sponsors.community SponsorKind.Community)
            ]
        , div []
            [ div [ Attr.class "centered-body-title" ] [ h2 [] [ text "Silver Sponsor" ] ]
            , div [ class "partners-logo" ] (transformSponsor gd.sponsors.silver SponsorKind.Silver)
            ]
        , div []
            [ div [ Attr.class "centered-body-title" ] [ h2 [] [ text "J'aime Scala Sponsor" ] ]
            , div [ class "partners-logo" ] (transformSponsor gd.sponsors.jaimeScala SponsorKind.JaimeScala)
            ]
        ]
