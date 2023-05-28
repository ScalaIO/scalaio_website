module View.Home exposing (view)

import Html exposing (Html, a, div, h2, hr, iframe, node, p, span, text)
import Html.Attributes as Attr exposing (class, style)


cfp : Html msg
cfp =
    div [ class "home-news" ]
        [ h2 [ Attr.class "home-title" ] [ text "Call for paper for edition 2023 is open" ]
        , div [ class "cfp" ]
            [ span [ Attr.class "cfp-icon" ] [ text "💡" ]
            , p [] [ text "We actively are looking for speakers. If you want to share some functional programming aspect with us, feel free to fulfill ", a [ Attr.href "https://www.papercall.io/scalaio2023", Attr.target "_blank" ] [ text "your submission" ], text "." ]
            ]
        ]


view : Html msg
view =
    div [ Attr.class "home" ]
      [cfp, h2 [ Attr.class "home-title" ] [ text "Buy your ticket for edition 2023 now" ]
              , p [] [ text "ScalaIO is a community based, non-profit event. See our ", a [ Attr.href "/faq", Attr.target "_blank" ] [ text "F.A.Q" ], text " for more information." ]
              , iframe
                  [ Attr.src "https://yurplan.com/events/Scala-IO-2023/105180/tickets/widget?widget=dGlja2V0aW5nV2lkZ2V0WXBfMTAzMTU2XzEwNjU2Nw%3D%3D&from=widget_106567&wversion=1&culture=fr"
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

      --  [ p [ Attr.class "home-title" ] [ text "ScalaIO 2023 is coming 😊" ],
      --  p [ Attr.class "home-title" ]
      --    [ text "Stay tune ! 🔥" ] ]
