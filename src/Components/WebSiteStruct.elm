module Components.WebSiteStruct exposing (globalPageStructure)

import Components.DataStruct exposing (GlobalData, Sponsor, SponsorKind(..), computeCssSponsor)
import Components.Footer exposing (footer)
import Components.Utils exposing (capitalize, transformSponsor)
import Html exposing (Html, div, h1, h3, hr, img, input, label, li, nav, p, span, text, ul, a)
import Html.Attributes as Attr exposing (..)
import String exposing (..)


viewLink : String -> Html msg
viewLink path =
    a [ Attr.href ("/" ++ path), class "uncommon-a" ] [ text (String.replace "-" " " path |> capitalize) ]


header : Html msg
header =
    div [ Attr.class "header" ]
        [ 
            img [ src "/assets/logos/scalaio/scalaio_short.svg", alt "scalaio logo" ] [],
            h1 [ Attr.class "header-title" ] [ text "The Scala event in France!" ],
            span [ Attr.class "header-teaser" ] [
                text "February 2024 - ",
                span [ Attr.class "red" ] [ text "Nantes" ],
                span [ ] [text " @ "],
                a [ Attr.href "https://maps.app.goo.gl/o22S4SjA2v11R6ef8"] [text "Le Palace"]
            ]
        ]


navbar : Html msg
navbar =
    Html.header [ class "navbar" ]
        [ a [ Attr.href "/", class "uncommon-a" ] [ text "Scala", span [ Attr.class "red" ] [ text "IO" ] ]
        , label [ for "toggle-1", class "toggle-menu" ]
            [ ul []
                [ li [] []
                , li [] []
                , li [] []
                ]
            ]
        , input [ type_ "checkbox", id "toggle-1" ] []
        , nav []
            [ ul []
                [
                -- li [] [ viewLink "venue" ]
                --, li [] [ viewLink "schedule" ]
                --, li [] [ viewLink "workshops" ]
                --, li [] [ viewLink "speakers" ]
                --, li [] [ viewLink "partners" ]
                --, li [] [ viewLink "sponsorship" ]
                --, li [] [ viewLink "faq" ]
                --,
                 li [] [ viewLink "hall-of-fame" ]

                --, DropDown.view model |> Html.map wrapDd
                ]
            ]
        ]


sponsors : GlobalData -> Html msg
sponsors data =
    div [ class "sponsors" ]
        [ div [ class "sponsors-containers" ] (transformSponsor data.sponsors.platine Platine)
        , div [ class "sponsors-containers" ] (transformSponsor data.sponsors.gold Gold)
        ]


globalPageStructure : GlobalData -> Html msg -> List (Html msg)
globalPageStructure data bodyContent =
    [ navbar, header, div [ Attr.class "body" ] [ bodyContent ], sponsors data, footer ]
