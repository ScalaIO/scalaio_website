module Components.Structs exposing (publicFooter, publicHeader, publicNav)

import Components.DropDown as DropDown exposing (..)
import Components.Utils exposing (capitalize)
import Html exposing (Html, button, div, footer, img, nav)
import Html.Attributes as Attr exposing (..)
import String exposing (..)
import Svg exposing (..)


viewLink : String -> Html msg
viewLink path =
    Html.a [ Attr.href path ] [ Html.text (capitalize path) ]


publicHeader : Html msg
publicHeader =
    div [ Attr.class "flex grow flex-col items-center header justify-between" ]
        [ img [ src "assets/logos/scalaio/scalaio_black.svg", alt "scalaio logo" ] []
        , Html.h1 [ Attr.class "headerTitle" ] [ Html.text "The Scala event in France!" ]
        , Html.h2 [ Attr.class "teaser" ] [ Html.span [] [ Html.text "October 28th, 2022 - Paris, France" ] ]
        ]


publicNav : DropDown.Model -> (DropDown.MsgChangeState -> msg) -> Html msg
publicNav model wrapDd  =
    nav [ Attr.class "flex justify-center items-center gap-x-8 navheaderColor" ]
        [ Html.header []
            [ Html.a [ Attr.class "brand" ] [ Html.text "Scala", Html.span [ Attr.class "red" ] [ Html.text "IO" ] ] ]
        , Html.div [] [ viewLink "venue" ]
        , Html.div [] [ viewLink "Speakers" ]
        , Html.div [] [ viewLink "Partners" ]
        , Html.div [] [ viewLink "Talks" ]
        , Html.div [] [ viewLink "Schedule" ]
        , Html.div [] [ viewLink "Videos" ]
        , Html.div [] [ viewLink "FAQ" ]
        , Html.div [] [ viewLink "Hall of fame" ]
        , DropDown.view model |> Html.map wrapDd
        ]


publicFooter : Html msg
publicFooter =
    div [ Attr.class "flex justify-center items-end" ] [ Html.footer [] [ Html.text "footer" ] ]
