module View.Venue exposing (..)

import FontAwesome as Icon exposing (Icon)
import FontAwesome.Solid as Icon
import FontAwesome.Styles as Icon
import Html exposing (Html, a, div, h2, iframe, img, li, p, text, ul)
import Html.Attributes exposing (class, height, href, property, src, target, width)
import Json.Encode
import Svg.Attributes as SvgA


route : Icon id -> String -> Html msg
route icon indications =
    div [] [ icon |> Icon.styled [ SvgA.class "red" ] |> Icon.view, text " ", text indications ]


subListRoute : List ( String, String ) -> Html msg
subListRoute items =
    div [ class "venue-reach-instruction-details" ]
        [ ul []
            (List.map (\item -> li [ class "venue-reach-instruction-details-item" ] [ img [ src ("/assets/icons/" ++ Tuple.second item ++ ".svg"), class "icon-venue" ] [], text (Tuple.first item) ]) items)
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
                [ div [ class "venue-reach-title" ] [ text "Transports" ]
                , Icon.css
                , route Icon.train "Closest train stations from the venue : "
                , subListRoute [ ( "Gare de Lyon", "train" ), ( "Gare de Montparnasse", "train" ), ( "Gare de Saint Lazare", "train" ) ]
                , route Icon.subway "The venue can be accessed by subway :"
                , subListRoute [ ( "Station Boissière, Ligne 6", "metro6" ), ( "Station Victor-Hugo, Ligne 2", "metro2" ), ( "Station Trocadero, Ligne 9", "metro9" ), ( "Charles de Gaulle-Étoile, RER A", "rera" ) ]
                , route Icon.car "Use the following address for your GPS :"
                , subListRoute [ ( "Lat.: 48.862725, Long.: 2.287592", "boussole" ) ]
                , route Icon.car "Available car park close to the venue :"
                , subListRoute [ ( "Autocité, Avenue Foch (2000 places at 300m)", "parking" ), ( "74 avenue Victor Hugo (600 places at 50m)", "parking" ), ( "120 avenue Victor Hugo (500 places at 300m)", "parking" ), ( "35 rue St Didier (200 places at 200m)", "parking" ) ]
                , route Icon.bicycle "For the healthiest of us, there are numerous bike rental stations around and there is one very close to the venue."
                , div [ class "venue-reach-title" ] [ text "Hotels" ]
                , div [ class "venue-reach-hotel-link" ]
                    [ img [ src "/assets/icons/airbnb.svg", class "icon-venue" ] []
                    , a
                        [ href "https://www.airbnb.com/s/69-Rue-Boissi%C3%A8re--Paris--France/homes?tab_id=home_tab&refinement_paths%5B%5D=%2Fhomes&flexible_trip_lengths%5B%5D=one_week&price_filter_input_type=0&query=69%20Rue%20Boissi%C3%A8re%2C%20Paris&date_picker_type=calendar&checkin=2022-11-03&checkout=2022-11-04&adults=1&source=structured_search_input_header&search_type=autocomplete_click&price_filter_num_nights=1&place_id=ChIJOcH4ZvBv5kcRDhZM0ol6uNc"
                        , target "_blank"
                        ]
                        [ text "Access to pre setup link on Air-bnb" ]
                    ]
                , div [ class "venue-reach-hotel-link" ]
                    [ img [ src "/assets/icons/booking.svg", class "icon-venue" ] []
                    , a
                        [ href "https://www.booking.com/searchresults.fr.html?label=msn-APBgIvrZ0FSl3i_Ja_RdBg-80470634554589%3Atikwd-16659123052%3Aloc-66%3Anes%3Amte%3Alp127187%3Adec%3Aqsreservation+hotel&sid=2ce13fa2392ff8d5a7742054d77884aa&aid=393655&lang=fr&sb_lp=1&src=index&error_url=https%3A%2F%2Fwww.booking.com%2Findex.fr.html%3Faid%3D393655%26label%3Dmsn-APBgIvrZ0FSl3i_Ja_RdBg-80470634554589%253Atikwd-16659123052%253Aloc-66%253Anes%253Amte%253Alp127187%253Adec%253Aqsreservation%2520hotel%26sid%3D2ce13fa2392ff8d5a7742054d77884aa%26sb_price_type%3Dtotal%26%26&ss=Paris%2C+%C3%8Ele-de-France%2C+France&is_ski_area=&checkin_year=2022&checkin_month=11&checkin_monthday=3&checkout_year=2022&checkout_month=11&checkout_monthday=4&group_adults=1&group_children=0&no_rooms=1&b_h4u_keep_filters=&from_sf=1&ss_raw=Paris&ac_position=0&ac_langcode=fr&ac_click_type=b&dest_id=-1456928&dest_type=city&iata=PAR&place_id_lat=48.85668&place_id_lon=2.351476&search_pageview_id=3cfb982781e500e7&search_pageview_id=3cfb982781e500e7&search_selected=true&ac_suggestion_list_length=5&ac_suggestion_theme_list_length=0&nflt=pri%3D2%3Bpri%3D1"
                        , target "_blank"
                        ]
                        [ text "Access to pre setup link on Booking.com" ]
                    ]
                , div [ class "venue-reach-hotel-link" ]
                    [ img [ src "/assets/icons/hotelscom.svg", class "icon-venue" ] []
                    , a
                        [ href "https://fr.hotels.com/Hotel-Search?adults=1&d1=2022-11-03&d2=2022-11-04&destination=Paris%2C%20France&endDate=2022-11-04&latLong=48.856696%2C2.351761&regionId=2734&selected=&semdtl=&sort=RECOMMENDED&startDate=2022-11-03&theme=&useRewards=false&userIntent="
                        , target "_blank"
                        ]
                        [ text "Access to pre setup link on Hotels.com" ]
                    ]
                ]
            ]

        --, h2 [ class "venue-title" ] [ text "Hotels" ]
        --, p [] [ text "We haven't been able to negociate an interesting group deal, you can check the ", a [ href "https://shorturl.at/pQWZ4", target "_blank" ] [ text "Hotels around the venue" ], text "." ]
        ]
