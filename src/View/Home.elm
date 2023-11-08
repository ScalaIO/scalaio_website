module View.Home exposing (view)

import Html exposing (Html, a, div, h2, hr, iframe, node, p, span, text, ul, li)
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
            h2 [ Attr.class "home-title" ] [ text "Scala.IO comes back!" ],
            p [] [ text "We are happy to announce that Scala.IO will be back early 2024! To fine-tune the organization, we need to collect some information from you about your availabilities and other things. Please fill this form as precisely as possible for us :-)", ul [ Attr.class "list-no-vmargin"] [
                li [] [a [ Attr.href "https://forms.gle/FcA2JprHk4L6Qx6g9", Attr.target "_blank" ] [ text "English version"]],
                li [] [a [ Attr.href "https://forms.gle/E4VCTCPXiSdujV1c7", Attr.target "_blank"] [ text "Version Française"]]
                ]
            ]
        ]

view : Html msg
view =
    div [ Attr.class "home" ]
      [comeback,div [Attr.class "home-title"] [text "ScalaIO team"]]

      --  [ p [ Attr.class "home-title" ] [ text "ScalaIO 2023 is coming 😊" ],
      --  p [ Attr.class "home-title" ]
      --    [ text "Stay tune ! 🔥" ] ]
