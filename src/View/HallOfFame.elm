module View.HallOfFame exposing (view)

import Components.DataStruct exposing (Contribution, Contributor, GlobalData)
import FontAwesome as Icon exposing (Icon)
import FontAwesome.Brands as Icon
import FontAwesome.Styles as Icon
import Html exposing (Html, a, div, h2, h3, li, p, text, ul)
import Html.Attributes as HtmlA exposing (class, href, target)
import List exposing (concat, map)
import Maybe


showTwitter : Maybe String -> List (Html msg)
showTwitter maybeLink =
    case maybeLink of
        Just link ->
            [ a [ href link, target "_blank" ] [ Icon.twitter |> Icon.styled [ HtmlA.style "color" "#1DA1F2" ] |> Icon.view ] ]

        Nothing ->
            []


showContributor : Contributor -> Html msg
showContributor contributor =
    li []
        (showTwitter contributor.twitter
            ++ [ text contributor.name
               , text "@"
               , text contributor.company
               ]
        )


showContribution : Contribution -> Html msg
showContribution contribution =
    div [ class "flex flex-col items-center" ]
        [ h3 [] [ String.fromInt contribution.year |> String.append "Scala.IO " |> text ]
        , ul [ class "hof-contributors flex items-center flex-col" ] (map showContributor contribution.contributors)
        ]


view : GlobalData -> Html msg
view gd =
    div [ class "centered-body flex flex-col items-center" ]
        [ Icon.css
        , h2 [ class "centered-body-title" ] [ text "Hall of fame" ]
        , p [] [ text "💡 Buy a \"Generous donator\" pass to get your name displayed on this page as one of the absolute Scala.IO supporter !" ]
        , div [] (map showContribution gd.contributions)
        ]
