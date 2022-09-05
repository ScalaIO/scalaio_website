module View.Schedule exposing (..)


import Components.DataStruct exposing (GlobalData)
import Html exposing (Html, a, div, h2, p, span, text)
import Html.Attributes as Attr exposing (class)
view : GlobalData -> Html msg
view gd =
    div [class "schedule" ]
        [  div [class "schedule-info"] [
           div[][text "The conference runs from 9:00 am to 6:30 pm"]]
           ,div [class "schedule-info"] [div[][text "At 8 am, registration will open and a breakfast will be served."]
           ],
           div [class "schedule-program-line"] [
                        div[class "schedule-program-title-item"][
                        text "ScalaIO 2022 Program"]]
           ,div [class "schedule-program-line"] [
                        div[class "schedule-program-subtitle-item"][
                        p [][text "The CFP is still opened. ", a [ Attr.href "https://www.papercall.io/scalaio2022", Attr.target "_blank" ][text "(here)"]]
                        ,p [][text "The schedule will be published later."]]]
           ,div [class "schedule-program-line"] [
                div[class "schedule-program-time-item"][text "08:00 - 09:00"]
                ,div[class "schedule-program-subject-item"][text "Registration"]]
            ,div [class "schedule-program-line"] [
                div[class "schedule-program-time-item"][text "09:00 - 09:20"]
                ,div[class "schedule-program-subject-item"][text "Introduction"]]
            ,div [class "schedule-program-line"] [
                div[class "schedule-program-time-item"][text "09:25 - 10:20"]
                ,div[class "schedule-program-subject-item"][text "Keynote"]]
            ,div [class "schedule-program-line"] [
                div[class "schedule-program-time-item"][text "10:30 - 11:25"]
                ,div[class "schedule-program-subject-talk"][text "Talk"]
                ,div[class "schedule-program-subject-talk"][text "Talk"]]
            ,div [class "schedule-program-line"] [
                div[class "schedule-program-time-item"][text "11:30 - 12:30"]
                ,div[class "schedule-program-subject-talk"][text "Talk"]
                ,div[class "schedule-program-subject-talk"][text "Talk"]]
            ,div [class "schedule-program-line"] [
                div[class "schedule-program-time-item"][text "12:25 - 14:00"]
                ,div[class "schedule-program-subject-item"][text "Lunch break"]]
           ,div [class "schedule-program-line"] [
                div[class "schedule-program-time-item"][text "14:00 - 14:55"]
                ,div[class "schedule-program-subject-talk"][text "Talk"]
                ,div[class "schedule-program-subject-talk"][text "Talk"]]
           ,div [class "schedule-program-line"] [
               div[class "schedule-program-time-item"][text "15:00 - 16:00"]
               ,div[class "schedule-program-subject-talk"][text "Talk"]
               ,div[class "schedule-program-subject-talk"][text "Talk"]]
           ,div [class "schedule-program-line"] [
               div[class "schedule-program-time-item"][text "16:00 - 16:30"]
               ,div[class "schedule-program-subject-item"][text "Coffee break"]]
           ,div [class "schedule-program-line"] [
              div[class "schedule-program-time-item"][text "16:30 - 17:25"]
              ,div[class "schedule-program-subject-talk"][text "Talk"]
              ,div[class "schedule-program-subject-talk"][text "Talk"]]
           ,div [class "schedule-program-line"] [
              div[class "schedule-program-time-item"][text "17:30 - 18:30"]
              ,div[class "schedule-program-subject-talk"][text "Talk"]
              ,div[class "schedule-program-subject-talk"][text "Talk"]]

        ]