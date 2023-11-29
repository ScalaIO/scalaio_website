module View.Home exposing (view)

import Html exposing (Html, a, b, div, h2, hr, iframe, li, node, p, span, text, ul)
import Html.Attributes as Attr exposing (class, style)


cfp : Html msg
cfp =
    div [ class "home-news" ]
        [ h2 [ Attr.class "home-title" ] [ text "Call fDr paper for edition 2023 is open" ]
        , div [ class "cfp" ]
            [ span [ Attr.class "cfp-icon" ] [ text "💡" ]
            , p [] [ text "We actively are looking for speakers. If you want to share some functional programming aspect with us, feel free to fulfill ", a [ Attr.href "https://www.papercall.io/scalaio2023", Attr.target "_blank" ] [ text "your submission" ], text "." ]
            ]
        ]

comeback : Html msg
comeback =
    div [ class "home-news" ]
        [ 
            h2 [ Attr.class "home-title" ] [ text "Save the date!" ],
            p [] [
              text "We are happy to announce that ScalaIO will take place on ",
              b [] [ text "February 15th - 16th 2024" ],
              text ". More information incoming soon."
            ],
            p [ Attr.align "center" ] [ text "See you there!" ]
        ]

view : Html msg
view =
    div [ Attr.class "home" ]
      [comeback,div [Attr.class "home-title"] [text "ScalaIO team"]]

      --  [ p [ Attr.class "home-title" ] [ text "ScalaIO 2023 is coming 😊" ],
      --  p [ Attr.class "home-title" ]
      --    [ text "Stay tune ! 🔥" ] ]
