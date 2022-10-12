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
        [ h2 [ Attr.class "home-title" ] [ text "We open sales for workshops! " ]
        , p []
            [ text "Those workshops will take place on "
            , span [ class "warning-focus" ] [ text "Thursday, 3 November" ]
            , text " on the day before conference. "
            , span [ class "warning-focus" ] [ text "Number of seats are limited." ]
            , text " To attend to it, you should buy combo tickets dedicated (1 workshop + 1 conference ticket)."
            ]
        , p [] [ text " Notice that if you already have a conference ticket, we’ll refund you after your purchase." ]
        , p []
            [ text "Those workshop will be hosted as well with the help of "
            , a [ Attr.href "https://www.ambient-it.net/", Attr.target "_blank" ] [ text "Ambient-it" ]
            , text " which allow training funding from “OPCO” (Les opérateurs de compétences) to french workers."
            , text " If you have any questions, there is an email : workshops@scala.io"
            ]
        , hr [ class "home-hr" ] [ text "xxxxxxxxxxxxxxxxxxxxxxxxxxx" ]
        , h2 [ Attr.class "home-title" ] [ text "Buy your ticket for edition 2022 now" ]
        , p [] [ text "ScalaIO is a community based, non-profit event. See our ", a [ Attr.href "/faq", Attr.target "_blank" ] [ text "F.A.Q" ], text " for more information." ]
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
