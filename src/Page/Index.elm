module Page.Index exposing (Data, Model, Msg, page)

import Components.DropDown as DropDown
import Components.Structs exposing (..)
import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Html exposing (..)
import Html.Attributes as Attr
import Page exposing (Page, StaticPayload, PageWithState)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import View exposing (View)
import Browser.Navigation
import Path exposing (..)



type alias Model =
    { dropdown : DropDown.Model
    }

init:Maybe PageUrl -> Shared.Model -> StaticPayload Data RouteParams -> ( Model, Cmd Msg )
init _ _ _  = ({dropdown = False}, Cmd.none)

subscriptions : Maybe PageUrl -> RouteParams -> Path -> Model -> Sub Msg
subscriptions _ _ _ model = Sub.none

type Msg
    = Never
    | DropDownMsg DropDown.MsgChangeState


type alias RouteParams =
    {}


page : PageWithState RouteParams Data Model Msg
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildWithLocalState { view = view, init = init, update = update, subscriptions = subscriptions }


data : DataSource Data
data =
    DataSource.succeed ()


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "ScalaIO"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "TODO"
        , locale = Nothing
        , title = "TODO title" -- metadata.title -- TODO
        }
        |> Seo.website


type alias Data =
    ()


view :
    Maybe PageUrl
    -> Shared.Model
    -> Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel model static =
    { title = "Home"
    , body = [ publicNav model.dropdown DropDownMsg, publicHeader, div [Attr.class "body"] [ Html.text "Body" ], publicFooter ]
    }


update : PageUrl -> Maybe Browser.Navigation.Key -> Shared.Model -> StaticPayload Data RouteParams -> Msg -> Model -> ( Model, Cmd Msg )
update maybeUrl _ sharedModel static msg model =
    case msg of
        Never ->
            ( model, Cmd.none )

        DropDownMsg m ->
            ( { model | dropdown = DropDown.update m model.dropdown }, Cmd.none )
