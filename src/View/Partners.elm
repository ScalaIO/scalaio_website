module View.Partners exposing (view)

import Components.DataStruct as SponsorKind exposing (GlobalData, SponsorKind)
import Components.Utils exposing (transform)
import Html exposing (Html, div, h1, text)
import Html.Attributes as Attr exposing (class)


view : GlobalData -> Html msg
view gd =
    div [ Attr.class "flex  flex-col gap-y-20" ]
        [ div [ Attr.class "flex justify-center" ] [ h1 [] [ text "Platinum Sponsor" ] ]
        , div [ class "flex justify-around" ] (transform gd.sponsors.platine SponsorKind.Platine)
        , div [ Attr.class "flex justify-center" ] [ h1 [] [ text "Gold Sponsor" ] ]
        , div [ class "flex justify-around" ] (transform gd.sponsors.gold SponsorKind.Gold)
        , div [ Attr.class "flex justify-center" ] [ h1 [] [ text "Silver Sponsor" ] ]
        , div [ class "flex justify-around" ] (transform gd.sponsors.silver SponsorKind.Silver)
        , div [ Attr.class "flex justify-center" ] [ h1 [] [ text "J'aime Scala Sponsor" ] ]
        , div [ class "flex justify-around" ] (transform gd.sponsors.jaimeScala SponsorKind.JaimeScala)
        , Html.hr [] []
        ]
