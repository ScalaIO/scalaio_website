module View.Partners exposing (view)

import Components.DataStruct as SponsorKind exposing (GlobalData, SponsorKind)
import Components.Utils exposing (transformSponsor)
import Html exposing (Html, div, h2, text)
import Html.Attributes as Attr exposing (class)


view : GlobalData -> Html msg
view gd =
    div [ Attr.class "flex  flex-col gap-y-20 partners" ]
        [ div [ Attr.class "flex justify-center" ] [ h2 [] [ text "Platinum Sponsor" ] ]
        , div [ class "flex justify-around" ] (transformSponsor gd.sponsors.platine SponsorKind.Platine)
        , div [ Attr.class "flex justify-center" ] [ h2 [] [ text "Gold Sponsor" ] ]
        , div [ class "flex justify-around" ] (transformSponsor gd.sponsors.gold SponsorKind.Gold)
        , div [ Attr.class "flex justify-center" ] [ h2 [] [ text "Silver Sponsor" ] ]
        , div [ class "flex justify-around" ] (transformSponsor gd.sponsors.silver SponsorKind.Silver)
        , div [ Attr.class "flex justify-center" ] [ h2 [] [ text "J'aime Scala Sponsor" ] ]
        , div [ class "flex justify-around" ] (transformSponsor gd.sponsors.jaimeScala SponsorKind.JaimeScala)
        ]
