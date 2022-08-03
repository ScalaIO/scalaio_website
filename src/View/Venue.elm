module View.Venue exposing (..)

import FontAwesome as Icon exposing (Icon)
import FontAwesome.Attributes as Icon
import FontAwesome.Solid as Icon
import FontAwesome.Styles as Icon
import Html exposing (Html, a, div, h2, i, iframe, p, text)
import Html.Attributes exposing (class, height, href, property, src, target, width)
import Json.Encode
import Svg.Attributes as SvgA


route icon indications =
    div [] [ icon |> Icon.styled [ SvgA.class "red" ] |> Icon.view, text " ", text indications ]


view : Html msg
view =
    div [ class "venue" ]
        [ h2 [ class "venue-title" ] [ text "ScalaIO will be held in La Grande Crypte in Paris, France" ]
        , p [] [ text "La Grande Crypte is great for 300-500 people and perfectly equipped for conferences and hosts other international conferences." ]
        , p [] [ text "Should you have the time, we recommend extending your stay in Paris beyond the conference to enjoy the city. It is famous all over the world for it's gastronomy and quality of life." ]
        , h2 [ class "venue-title" ] [ text "Getting to La Grande Crypte" ]
        , div [ class "venue-reach" ]
            [ iframe
                [ class "venue-reach-map"
                , width 600
                , height 450
                , property "loading" (Json.Encode.string "lazy")
                , property "allowfullscreen" (Json.Encode.string "true")
                , property "referrerpolicy" (Json.Encode.string "no-referrer-when-downgrade")
                , src "https://www.google.com/maps/embed/v1/place?key=AIzaSyAFQSTyC4ZJV3VFebGKqTF3ginOikoRwnQ&q=La+Grande+Crypt+Paris"
                ]
                []
            , div [ class "venue-reach-instruction" ]
                [ Icon.css
                , route Icon.plane "Once at Lyon Part Dieu, switch to T4 heading for La DOUA - I.U.T Feyssine and stop at La Doua - Gaston Berger."
                , route Icon.subway "La Grande Crypt is a few stops away from the Lyon Part-Dieu train station using tram T1 or tram T4, heading for La DOUA - I.U.T Feyssine and stop at La Doua - Gaston Berger. (10-15 minutes)."
                , route Icon.car "Use the following address for your GPS :"
                , route Icon.bicycle "For the healthiest of us, there are numerous bike rental stations around and there is one very close to the CPE School (Velo'v DOUA/ Avenue des arts)."
                ]
            ]
        , h2 [ class "venue-title" ] [ text "Hotels" ]
        , p [] [ text "We haven't been able to negociate an interesting group deal, you can check the ", a [ href "https://shorturl.at/pQWZ4", target "_blank" ] [ text "Hotels around the venue" ], text "." ]
        ]
