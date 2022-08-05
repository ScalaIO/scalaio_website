module View.Faq exposing (view)

import Html exposing (Html, a, div, h2, h3, p, text)
import Html.Attributes exposing (class, href, target)


view : Html msg
view =
    div [ class "faq" ]
        [ h2 [ class "faq-title" ] [ text "Frequently Asked Questions" ]
        , h3 [ class "faq-sub-title" ] [ text "Is there a Code of Conduct ?" ]
        , p [] [ text "Yes, there is a ", a [ href "/code-of-conduct", target "_blank" ] [ text "Code of Conduct" ], text "." ]
        , h3 [ class "faq-sub-title" ] [ text "Are you cool ?" ]
        , p [] [ text "Yes we are !" ]
        , h3 [ class "faq-sub-title" ] [ text "Do I need to speak French ?" ]
        , p [] [ text "You should not be worried if you speak English. We will try to make your journey as smooth as possible." ]
        , h3 [ class "faq-sub-title" ] [ text "How do you spend the money ?" ]
        , p [] [ text "The conference is non-profit, organized by volunteers from the French Scala users community. The money from tickets sales and sponsors is used solely to pay for the conference hall, the food, the technical setup (speaker amplification, video projectors, video recording), some swag, and as much T&E covering as possible for speakers who can't get backing from a company. Should money remain after the conference, it will be used to further compensate speakers. In the event that there would still be some money left afterward, it would be used for the next ScalaIO." ]
        , p [] [ text "Contact us at ", a [ href "mailto:contact@scala.io", target "_blank" ] [ text "contact@scala.io" ], text " if you want more information." ]
        , h3 [ class "faq-sub-title" ] [ text "Any other questions ?" ]
        , p [] [ text "Contact us at ", a [ href "mailto:contact@scala.io", target "_blank" ] [ text "contact@scala.io" ], text " and we’ll try to help you as much as possible." ]
        ]
