module Components.Helpers exposing (publicHeader)

import Components.DropDown exposing (..)
import Html exposing (Html, nav)
import Html.Attributes as Attr exposing (..)
import Svg exposing (..)


viewLink : String -> Html msg
viewLink path =
    Html.a [ Attr.href path ] [ Html.text path ]


publicHeader : List (Html msg)
publicHeader =
    [ nav [ Attr.class "flex justify-center gap-x-8" ]
        [ Html.header []
            [ Html.a [ Attr.class "brand" ] [ Html.text "Scala", Html.span [ Attr.class "red" ] [ Html.text "IO" ] ] ]
        , Html.div [] [ viewLink "Venue" ]
        , Html.div [] [ viewLink "Speakers" ]
        , Html.div [] [ viewLink "Partners" ]
        , Html.div [] [ viewLink "Talks" ]
        , Html.div [] [ viewLink "Schedule" ]
        , Html.div [] [ viewLink "Videos" ]
        , Html.div [] [ viewLink "FAQ" ]
        , Html.div [] [ viewLink "Hall of fame" ]
        ]
    ]
