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

cancel : Html msg
cancel =
    div [ class "home-news" ]
        [ h2 [ Attr.class "home-title" ]
         [ text "Regrettably, we must announce the cancellation of the scheduled ScalaIO conference. After extensive deliberation, we couldn't meet the necessary conditions to deliver the event you deserve"

    ]

   ]

view : Html msg
view =
    div [ Attr.class "home" ]
      [cancel,div [Attr.class "home-title"] [text "ScalaIO team"]]

      --  [ p [ Attr.class "home-title" ] [ text "ScalaIO 2023 is coming 😊" ],
      --  p [ Attr.class "home-title" ]
      --    [ text "Stay tune ! 🔥" ] ]
