module Components.Utils exposing (capitalize, transform)

import Components.DataStruct exposing (Sponsor, SponsorKind, computeCss)
import Html exposing (Html, a, img)
import Html.Attributes as Attr exposing (alt, class, src)
import String exposing (..)


capitalize : String -> String
capitalize str =
    (left 1 >> toUpper) str ++ dropLeft 1 str


sponsorToUrl : SponsorKind -> Sponsor -> Html msg
sponsorToUrl k s =
    a [ Attr.href s.url, Attr.target "_blank" ] [ img [ src ("assets/sponsors/logo-" ++ s.name ++ ".svg"), alt s.name, class ("flex " ++ computeCss k) ] [] ]


transform : List Sponsor -> SponsorKind -> List (Html msg)
transform data k =
    List.map (sponsorToUrl k) data
