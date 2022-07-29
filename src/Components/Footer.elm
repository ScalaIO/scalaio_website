module Components.Footer exposing (footer)

import Html exposing (Html, div, h1, h3, input, label, li, p, span, text, ul)
import Html.Attributes as Attr exposing (action, class, id, method, name, novalidate, target)


networks : Html msg
networks =
    div [ class "footer-networks" ]
        [ h3 [] [ text "Social Network" ]
        , ul [] [ li [] [ Html.a [ Attr.href "https://twitter.com/ScalaIO_FR", Attr.target "_blank", class "footer-networks-link" ] [ Html.text "👉 Twitter" ] ] ]
        ]


newsletter : Html msg
newsletter =
    div [ class "footer-newsletter" ]
        [ h3 [] [ text "Newsletter" ]
        , p [] [ text "Subscribe to our newsletter and be the first to know about our news !" ]
        , Html.form
            [ action "https://scala.us13.list-manage.com/subscribe/post?u=32bc8243e81ad6b3dde9a6717&amp;id=c28c7e3f2b"
            , method "post"
            , id "mc-embedded-subscribe-form"
            , name "mc-embedded-subscribe-form"
            , class "footer-newsletter-form"
            , target "_blank"
            , novalidate True
            ]
            [ div [ ]
                [ div []
                    [ label
                        [ Attr.for "mce-EMAIL" ]
                        [ text "Email Address"
                        , span
                            []
                            [ text "* " ]
                        ]
                    , input
                        [ Attr.type_ "email"
                        , Attr.value ""
                        , Attr.name "EMAIL"
                        , Attr.class "required email form-control"
                        , Attr.id "mce-EMAIL"
                        ]
                        []
                    ]
                ]
            , Html.button [ Attr.type_ "submit", Attr.class "footer-newsletter-form-button" ] [ text "Subscribe" ]
            ]
        ]


copyright : Html msg
copyright =
    div [ class "footer-copyright" ]
        [ p []
            [ text "Scala"
            , span [ Attr.class "red", Attr.class "footer-copyright-io" ] [ text "IO" ]
            , text "conference, All Rights Reserved."
            ]
        ]


footer : Html msg
footer =
    div [ class "footer" ]
        [ div [ class "footer-menu" ]
            [ networks
            , newsletter
            ]
        , copyright
        ]
