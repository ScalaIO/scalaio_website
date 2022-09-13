module Page.Speakers exposing (Data, Model, Msg, page)

import Components.DataStruct as DataStruct exposing (GlobalData)
import Components.WebSiteStruct exposing (globalPageStructure)
import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import View exposing (View)
import View.Speakers


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    {}


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


type alias Data =
    GlobalData


data : DataSource Data
data =
    DataStruct.data


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "ScalaIO"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "ScalaIO logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "ScalaIO - Speakers"
        , locale = Nothing
        , title = "ScalaIO - Speakers" -- metadata.title -- TODO
        }
        |> Seo.website


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = "ScalaIO - Partners"
    , body = globalPageStructure static.data (View.Speakers.view static.data)
    }
