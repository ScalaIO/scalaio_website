module View.Workshops exposing (..)

import Components.DataStruct exposing (GlobalData)
import Components.Utils exposing (transformWorkshop)
import Html exposing (Html, a, div, h2, text, br, b)
import Html.Attributes as Attr exposing (class)


view : GlobalData -> Html msg
view gd =
    div [ class "centered-body" ]
        [ h2 [ class "workshop-program-title" ]
            [ text "Workshop 2022 Program" ]
        , div [ class "workshop-info" ]
            [ b [] [text "Workshop venue address : "] , text gd.ws.address ]
        , div [ class "workshop-info" ]
            [ b [] [text  "Workshop schedule : "] , text gd.ws.horaires ]
        , div [class "workshop-info"]
            [ b [] [text "Scala Spree : "] , text "Thurday, Novembre 3rd. From 1:30 pm to 5h30 pm, same venue."
            , br [] []
            , text "More informations for the opensource spreee "
            , a [Attr.href "https://github.com/scalacenter/sprees#paris-france-thursday-3rd-november-2022"] [text "Here."]]
        , div [ class "workshop-info workshop-info-warning" ]
            [ div []
                [ text "Workshop ticket include pass conference. It can be bought from our "
                , a [ Attr.href "/" ] [ text "ticketing" ]
                ]
            ]
        , div [ class "workshop-content" ] (transformWorkshop gd.ws.workshops)
        ]
