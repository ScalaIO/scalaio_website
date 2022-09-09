module Page.speakerDetails/id_ exposing (Model, Msg, Data, page)

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
import View.Speakerdetails


type alias Model =
    ()


type alias Msg =
    Never

type alias RouteParams = { speakerId : String }

page : Page RouteParams Data
page =
    Page.prerender
        { head = head
        ,routes=routes
        , data = data

        }
        |> Page.buildNoState { view = view }


routes : DataSource (List RouteParams)
routes =
    -- define all the allowed routes (all possible slugs)
    --Article.all |> DataSource.map (List.map (\article -> RouteParams article.slug))

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
        , siteName = "elm-pages"
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


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view _ _ static =
    { title = "ScalaIO - Hall of fame"
    , body = globalPageStructure static.data (View.Speakerdetails.view static.data)
    }
