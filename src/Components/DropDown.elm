module Components.DropDown exposing (..)

import Html exposing (Html, button, div)
import Html.Attributes as Attr exposing (..)
import Html.Events exposing (onClick)
import Svg exposing (..)
import Svg.Attributes as SvgAttr exposing (..)


type MsgChangeState
    = ChangeState


type alias Model =
    Bool


init : Model
init =
    False


menuButton : Html MsgChangeState
menuButton =
    div
        [ Attr.class "relative inline-block text-left"
        ]
        [ div []
            [ button
                [ Attr.type_ "button"
                , Attr.class "inline-flex justify-center w-full rounded-md shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-100 focus:ring-indigo-500"
                , Attr.id "menu-button"
                , Attr.attribute "aria-expanded" "true"
                , Attr.attribute "aria-haspopup" "true"
                , onClick ChangeState
                ]
                [ Html.text "Previous editions"
                , svg
                    [ SvgAttr.class "-mr-1 ml-2 h-5 w-5"
                    , SvgAttr.viewBox "0 0 20 20"
                    , SvgAttr.fill "currentColor"
                    , Attr.attribute "aria-hidden" "true"
                    ]
                    [ Svg.path
                        [ SvgAttr.fillRule "evenodd"
                        , SvgAttr.d "M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                        , SvgAttr.clipRule "evenodd"
                        ]
                        []
                    ]
                ]
            ]
        ]


view : Model -> Html MsgChangeState
view model =
    Html.div [] [ menuButton, menuDropDown model ]


menuDropDown : Model -> Html msg
menuDropDown model =
    let
        status =
            if model then
                "block"

            else
                "hidden"
    in
    div
        [ Attr.class (status ++ " origin-top-right absolute right--6 mt-0 w-56 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none")
        , Attr.attribute "role" "menu"
        , Attr.attribute "aria-orientation" "vertical"
        , Attr.attribute "aria-labelledby" "menu-button"
        , Attr.tabindex -1
        ]
        [ div
            [ Attr.class "py-1"
            , Attr.attribute "role" "none"
            ]
            [ {- Active: "bg-gray-100 text-gray-900", Not Active: "text-gray-700" -}
              button
                [ Attr.class "text-gray-700 block px-4 py-2 text-sm"
                , Attr.id "menu-item-0"
                ]
                [ Html.text "Item 1" ]
            ]
        ]


update : MsgChangeState -> Model -> Model
update msg model =
    case msg of
        ChangeState ->
            not model
