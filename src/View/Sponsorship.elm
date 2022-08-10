module View.Sponsorship exposing (view)

import Html exposing (Html, a, div, h2, h3, p, text)
import Html.Attributes exposing (class, href, target)


view : Html msg
view =
    div [ class "centered-body" ]
        [ h2 [ class "centered-body-title" ] [ text "Sponsorship opportunities" ]
        , p [] [ text "Become a ScalaIO 2022 sponsor and promote your services, products or simply increase your brand awareness with more than 350 passionate Scala, Spark, and FP languages developers!" ]
        , p [] [ text "We offer multiple sponsorship opportunities which are detailed in the ", a [ href "https://docs.google.com/presentation/d/1nZ_6r4r0M1VZNBUE41DtnKr6FVdjFyoWF-zbJ1BtdSw/edit?usp=sharing", target "_blank" ] [ text "following brochure" ], text ". You can also contact us to discuss your sponsorship: ", a [ href "mailto:sponsors@scala.io", target "_blank" ] [ text "sponsors@scala.io" ], text "." ]
        ]
