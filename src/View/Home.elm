module View.Home exposing (view)

import Html exposing (Html, a, div, h2, iframe, node, p, span, text)
import Html.Attributes as Attr exposing (class)


cfp : Html msg
cfp =
    div [ class "cfp" ]
        [ span [ Attr.class "cfp-icon" ] [ text "💡" ]
        , p [] [ text "We actively are looking for speakers. If you want to share some functional programming aspect with us, feel free to fulfill ", a [ Attr.href "https://www.papercall.io/scalaio2022", Attr.target "_blank" ] [ text "your submission" ], text "." ]
        ]


view : Html msg
view =
    div [ Attr.class "home" ]
        [ h2 [ Attr.class "home-title" ] [ text "Buy your ticket for edition 2022 now" ]
        , p [] [ text "ScalaIO is a community based, non-profit event. See our ", a [ Attr.href "/faq", Attr.target "_blank" ] [ text "F.A.Q" ], text " for more information." ]
        , cfp
        , iframe
            [ Attr.src "https://yurplan.com/event/Scala-IO-2022/88496/tickets/widget?widget=dGlja2V0aW5nV2lkZ2V0WXBfODY1MzdfODk1MDQ%3D&from=widget_89504&wversion=1&culture=fr"
            , class "home-ticketing"
            ]
            []
        , node "script"
            [ Attr.type_ "text/javascript"
            , Attr.src "https://assets.yurplan.com/yurplan-v1/dist/widget.js"
            ]
            []
        , div [ class "home-ticketing-disclaimer" ]
            [ text "If you get an error buying through the Iframe, please try using the  "
            , a [ Attr.href "https://yurplan.com/event/Scala-IO-2022/88496", Attr.target "_blank", class "href-link" ] [ text " minisite" ]
            , text " and "
            , a [ Attr.href "mailto:contact@scala.io", Attr.target "_blank", class "href-link" ] [ text "let us know" ]
            , text "."
            ]
        ]
