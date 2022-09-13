module View.Speakers exposing (..)

import Components.DataStruct as SponsorKind exposing (GlobalData, KindTalk(..), SponsorKind)
import Components.Utils exposing (transformSpeaker, transformSponsor)
import Html exposing (Html, div, h2, text)
import Html.Attributes as Attr exposing (class)


view : GlobalData -> Html msg
view gd =
    div []
        [ div [ Attr.class "flex justify-center" ] [ h2 [] [ text "Keynote" ] ]
        , div [ class "flex justify-around" ] (transformSpeaker gd.speakers.keynote Keynote)
        , div [ Attr.class "flex justify-center" ] [ h2 [] [ text "Talks" ] ]
        , div [ class "speakers-talk" ] (transformSpeaker gd.speakers.talk Talk)
        ]
