module Components.WebSiteStruct exposing (globalPageStructure)


import Components.DataStruct exposing (GlobalData, Sponsor, SponsorKind(..), computeCss)
import Components.Utils exposing (capitalize)
import Html exposing (Html, div, h3, img, input, label, li, nav, p, span, text, ul)
import Html.Attributes as Attr exposing (..)
import String exposing (..)
import Components.Utils exposing (transform)



viewLink : String -> Html msg
viewLink path =
    Html.a [ Attr.href path ] [ Html.text (capitalize path) ]


publicHeader : Html msg
publicHeader =
    div [ Attr.class "flex grow flex-col items-center header justify-around" ]
        [ img [ src "assets/logos/scalaio/scalaio_black.svg", alt "scalaio logo" ] []
        , div[class "flex flex-col gap-y-8 justify-around "][
        Html.h1 [ Attr.class "headerTitle flex " ] [ Html.text "The Scala event in France!" ]
        , Html.h2 [ Attr.class "teaser flex mx-2" ] [ Html.text "November 4th, 2022-", Html.span [ Attr.class "red" ] [ Html.text "Paris"], Html.text ", France" ]
        ]
        ]


publicNav : Html msg
publicNav  =
    nav [ Attr.class "flex justify-center items-center gap-x-8 navheaderColor" ]
        [ Html.header []
            [ Html.a [ Attr.class "brand" ] [ Html.text "Scala", Html.span [ Attr.class "red" ] [ Html.text "IO" ] ] ]
        --, Html.div [] [ viewLink "venue" ]
        --, Html.div [] [ viewLink "Speakers" ]
        , Html.div [] [ viewLink "partners" ]
        --, Html.div [] [ viewLink "Talks" ]
        --, Html.div [] [ viewLink "Schedule" ]
        --, Html.div [] [ viewLink "Videos" ]
        --, Html.div [] [ viewLink "FAQ" ]
        --, Html.div [] [ viewLink "Hall of fame" ]
        --, DropDown.view model |> Html.map wrapDd
        ]


publicFooter : Html msg
publicFooter =
    div [ Attr.class "flex grow flex-row footer justify-center" ] [
    Html.footer [Attr.class "flex grow flex-row"] [    div
                    [ Attr.class "flex social flex-col content-center items-center"]
                    [ h3 [][ text "Social Network" ]
                    , ul [] [li [][ Html.a [Attr.href "https://twitter.com/ScalaIO_FR", Attr.target "_blank", class "twitter-link"][Html.text "Twitter"]]]]
                    ,
                  div[ Attr.class "flex newsletter flex-col content-center justify-items justify-around"][h3 [][ text "Newsletter" ]
                       , p [][ text "Subscribe to our newsletter and be the first to know about our news !" ]
                       ,         {- Begin MailChimp Signup Form -}
                       Html.form
                           [ action "https://scala.us13.list-manage.com/subscribe/post?u=32bc8243e81ad6b3dde9a6717&amp;id=c28c7e3f2b",
                           method "post",
                            id "mc-embedded-subscribe-form",
                            name "mc-embedded-subscribe-form",
                            class "validate",
                            target "_blank",
                            novalidate True
                           ]
                           [ div [ Attr.class "controls mc-field-group"]
                               [ div[ Attr.class "form-group"][ label
                                       [ Attr.for "mce-EMAIL"]
                                       [ text "Email Address", span
                                           [ Attr.class "asterisk"
                                           ]
                                           [ text "*" ]
                                       ]
                                   , input[ Attr.type_ "email"
                                       , Attr.value ""
                                       , Attr.name "EMAIL"
                                       , Attr.class "required email form-control"
                                       , Attr.id "mce-EMAIL"][]
                                   ]
                                               {-/row-}
                               ]
                           ,             {- /container -}
                          Html.button [Attr.type_ "submit"][text "Subscribe"]

                           ]
                       ]
                  ]
                  ,    div  [class "copyright"][ p [][ text "Scala", span [ Attr.class "red"][ text "IO" ]
                                , text "conference, All Rights Reserved." ]
                            ]
                  ]






publicSponsors : GlobalData -> Html msg
publicSponsors data = div[class "flex flex-col"][div[class "flex justify-around"](transform  data.sponsors.platine Platine),div[class "flex  flex-wrap justify-around "](transform  data.sponsors.gold Gold)]

globalPageStructure : GlobalData -> Html msg  -> List (Html msg)

globalPageStructure data bodyContent= [ publicNav , publicHeader, div[Attr.class "body"][bodyContent],publicSponsors data, publicFooter ]