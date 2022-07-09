module View.Home exposing (view)


import Html exposing (Html, div, h1, iframe, p, text)
import Html.Attributes as Attr
import Html.Attributes exposing (srcdoc)


view:Html msg
view = div[Attr.class "flex  flex-col"][div[Attr.class "flex justify-center" ][h1[][text "Buy your ticket for edition 2022 now"]],
 div[Attr.class "flex justify-center "][text "ScalaIO is a community based, non-profit event. See our F.A.Q for more information."]
 ,iframe[srcdoc "https://yurplan.com/orga/Scala-IO/12404/ticketing/widget?wversion=1"][]
 ]