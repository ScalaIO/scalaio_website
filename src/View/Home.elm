module View.Home exposing (view)

import Html exposing (Html, a, div, h2, hr, iframe, node, p, span, text)
import Html.Attributes as Attr exposing (class, style)


cfp : Html msg
cfp =
    div [ class "home-news" ]
        [ h2 [ Attr.class "home-title" ] [ text "Call for paper for edition 2022 is open" ]
        , div [ class "cfp" ]
            [ span [ Attr.class "cfp-icon" ] [ text "💡" ]
            , p [] [ text "We actively are looking for speakers. If you want to share some functional programming aspect with us, feel free to fulfill ", a [ Attr.href "https://www.papercall.io/scalaio2022", Attr.target "_blank" ] [ text "your submission" ], text "." ]
            ]
        ]


view : Html msg
view =
    div [ Attr.class "home" ]
        [ p [ Attr.class "home-title" ] [ text "Scala.io 2022 is already over 🤧" ], p [ Attr.class "home-title" ] [ text "Thank you for coming and see you the 26th and 27th of October 2023 for the 10th edition !" ] ]
