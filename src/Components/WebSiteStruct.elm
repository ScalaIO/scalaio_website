module Components.WebSiteStruct exposing (globalPageStructure)

import Components.DataStruct exposing (GlobalData, Sponsor, SponsorKind(..), computeCss)
import Components.Footer exposing (footer)
import Components.Utils exposing (capitalize, transform)
import Html exposing (Html, div, h1, h3, img, input, label, li, nav, p, span, text)
import Html.Attributes as Attr exposing (..)
import String exposing (..)


viewLink : String -> Html msg
viewLink path =
    Html.a [ Attr.href path, class "uncommon-a" ] [ Html.text (String.replace "-" " " path |> capitalize) ]


header : Html msg
header =
    div [ Attr.class "header" ]
        [ img [ src "/assets/logos/scalaio/scalaio_short.svg", alt "scalaio logo" ] []
        , h1 [ Attr.class "header-title" ] [ Html.text "The Scala event in France!" ]
        , span [ Attr.class "header-teaser" ] [ Html.text "November 4th, 2022 - ", Html.span [ Attr.class "red" ] [ Html.text "Paris" ], Html.text ", France" ]
        ]


navbar : Html msg
navbar =
    nav [ Attr.class "flex justify-center items-center gap-x-8 navheaderColor" ]
        [ Html.header []
            [ Html.a [ Attr.href "/", class "uncommon-a" ] [ Html.text "Scala", Html.span [ Attr.class "red" ] [ Html.text "IO" ] ] ]
        , Html.div [] [ viewLink "venue" ]

        --, Html.div [] [ viewLink "Speakers" ]
        , Html.div [] [ viewLink "partners" ]

        --, Html.div [] [ viewLink "Talks" ]
        --, Html.div [] [ viewLink "Schedule" ]
        , Html.div [] [ viewLink "sponsorship" ]
        , Html.div [] [ viewLink "faq" ]
        , Html.div [] [ viewLink "hall-of-fame" ]

        --, DropDown.view model |> Html.map wrapDd
        ]


sponsors : GlobalData -> Html msg
sponsors data =
    div [ class "sponsors" ]
        [ div [ class "sponsors-containers" ] (transform data.sponsors.platine Platine)
        , div [ class "sponsors-containers" ] (transform data.sponsors.gold Gold)

        --  div [ class "sponsors-containers" ] (transform data.sponsors.gold Silver) TODO: Add when a silver sponsor is added
        ]


globalPageStructure : GlobalData -> Html msg -> List (Html msg)
globalPageStructure data bodyContent =
    [ navbar, header, div [ Attr.class "body" ] [ bodyContent ], sponsors data, footer ]
