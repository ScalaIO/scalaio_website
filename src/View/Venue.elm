module View.Venue exposing (..)

import FontAwesome as Icon exposing (Icon)
import FontAwesome.Solid as Icon
import FontAwesome.Styles as Icon
import Html exposing (Html, div, h2, iframe, img, li, p, text, ul)
import Html.Attributes exposing (class, height, property, src, width)
import Json.Encode
import Svg.Attributes as SvgA


route : Icon id -> String -> Html msg
route icon indications =
    div [] [ icon |> Icon.styled [ SvgA.class "red" ] |> Icon.view, text " ", text indications ]


subListRoute : List ( String, String ) -> Html msg
subListRoute items =
    div [ class "venue-reach-instruction-details" ]
        [ ul []
            (List.map (\item -> li [ class "venue-reach-instruction-details-item" ] [ img [ src ("assets/icons/" ++ Tuple.second item ++ ".svg"), class "icon-venue" ] [], text (Tuple.first item) ]) items)
        ]


view : Html msg
view =
    div [ class "centered-body" ]
        [ h2 [ class "centered-body-title" ] [ text "ScalaIO will be held in La Grande Crypte in Paris, France" ]
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
                , route Icon.train "The closest train stations from the venue : "
                , subListRoute [ ( "Gare de Lyon", "train" ), ( "Gare de Montparnasse", "train" ), ( "Gare de Saint Lazare", "train" ) ]
                , route Icon.subway "The venue can be accessed by subway :"
                , subListRoute [ ( "Station Boissière, Ligne 6", "metro6" ), ( "Station Victor-Hugo, Ligne 2", "metro2" ), ( "Station Trocadero, Ligne 9", "metro9" ), ( "Charles de Gaulle-Étoile, RER A", "rera" ) ]
                , route Icon.car "Use the following address for your GPS :"
                , subListRoute [ ( "Lat.: 48.862725, Long.: 2.287592", "boussole" ) ]
                , route Icon.car "Available car park close to the venue :"
                , subListRoute [ ( "Autocité, Avenue Foch (2000 places at 300m)", "parking" ), ( "74 avenue Victor Hugo (600 places at 50m)", "parking" ), ( "120 avenue Victor Hugo (500 places at 300m)", "parking" ), ( "35 rue St Didier (200 places at 200m)", "parking" ) ]
                , route Icon.bicycle "For the healthiest of us, there are numerous bike rental stations around and there is one very close to the venue."
                ]
            ]

        --, h2 [ class "venue-title" ] [ text "Hotels" ]
        --, p [] [ text "We haven't been able to negociate an interesting group deal, you can check the ", a [ href "https://shorturl.at/pQWZ4", target "_blank" ] [ text "Hotels around the venue" ], text "." ]
        ]
