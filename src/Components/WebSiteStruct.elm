module Components.WebSiteStruct exposing (globalPageStructure)

import Components.DataStruct exposing (GlobalData, Sponsor, SponsorKind(..), computeCss)
import Components.Footer exposing (footer)
import Components.Utils exposing (capitalize, transform)
import Html exposing (Html, div, h3, img, input, label, li, nav, p, span, text, ul)
import Html.Attributes as Attr exposing (..)
import String exposing (..)


viewLink : String -> Html msg
viewLink path =
    Html.a [ Attr.href path ] [ Html.text (capitalize path) ]


publicHeader : Html msg
publicHeader =
    div [ Attr.class "flex grow flex-col items-center header justify-around" ]
        [ img [ src "assets/logos/scalaio/scalaio_black.svg", alt "scalaio logo" ] []
        , div [ class "flex flex-col gap-y-8 justify-around " ]
            [ Html.h1 [ Attr.class "headerTitle flex " ] [ Html.text "The Scala event in France!" ]
            , Html.h2 [ Attr.class "teaser flex mx-2" ] [ Html.text "November 4th, 2022-", Html.span [ Attr.class "red" ] [ Html.text "Paris" ], Html.text ", France" ]
            ]
        ]


publicNav : Html msg
publicNav =
    nav [ Attr.class "flex justify-center items-center gap-x-8 navheaderColor" ]
        [ Html.header []
            [ Html.a [ Attr.class "brand" ] [ Html.text "Scala", Html.span [ Attr.class "red" ] [ Html.text "IO" ] ] ]

        --, Html.div [] [ viewLink "venue" ]
        --, Html.div [] [ viewLink "Speakers" ]
        , Html.div [] [ viewLink "partners" ]

        --, Html.div [] [ viewLink "Talks" ]
        --, Html.div [] [ viewLink "Schedule" ]
        --, Html.div [] [ viewLink "Videos" ]
        --, Html.div [] [ viewLink "FAQ" ]
        --, Html.div [] [ viewLink "Hall of fame" ]
        --, DropDown.view model |> Html.map wrapDd
        ]

publicSponsors : GlobalData -> Html msg
publicSponsors data =
    div [ class "flex flex-col" ] [ div [ class "flex justify-around" ] (transform data.sponsors.platine Platine), div [ class "flex  flex-wrap justify-around " ] (transform data.sponsors.gold Gold) ]


globalPageStructure : GlobalData -> Html msg -> List (Html msg)
globalPageStructure data bodyContent =
    [ publicNav, publicHeader, div [ Attr.class "body" ] [ bodyContent ], publicSponsors data, footer ]
