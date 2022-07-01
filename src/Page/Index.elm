module Page.Index exposing (Data, Msg, page)

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


init:Maybe PageUrl -> Shared.Model -> StaticPayload Data RouteParams -> ( Shared.Model, Cmd Msg )
init _ _ _  = ({showMobileMenu = False,dropdown = False}, Cmd.none)

subscriptions : Maybe PageUrl -> RouteParams -> Path -> Shared.Model -> Sub Msg
subscriptions _ _ _ model = Sub.none

type Msg
    = Never


type alias RouteParams =
    {}


page : PageWithState RouteParams Data Shared.Model Msg
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
            , alt = "scalaIO logo"
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
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = "Home"
    , body = [ publicNav sharedModel.dropdown DropDownMsg, publicHeader, div [Attr.class "body"] [ Html.text "Body" ], publicFooter ]
    }


update : PageUrl -> Maybe Browser.Navigation.Key -> Shared.Model -> StaticPayload Data RouteParams -> Msg -> ( Shared.Model, Cmd Msg )
update maybeUrl _ sharedModel static msg =
    case msg of
        Never ->
            ( sharedModel, Cmd.none )

        DropDownMsg m ->
            ( { sharedModel | dropdown = DropDown.update m sharedModel.dropdown }, Cmd.none )
