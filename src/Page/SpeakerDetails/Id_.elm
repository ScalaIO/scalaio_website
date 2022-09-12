module Page.SpeakerDetails.Id_ exposing (Data, Model, Msg, page)

import Components.DataStruct as DataStruct exposing (GlobalData, Speaker)
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


type alias RouteParams =
    { id : String }


page : Page RouteParams Data
page =
    Page.prerender
        { data = data
        , head = head
        , routes = routes
        }
        |> Page.buildNoState { view = view }


routes : DataSource (List RouteParams)
routes =
    DataStruct.dataSpeaker |> DataSource.map (List.map (\gd -> RouteParams gd.s.id))



-- --DataSource.succeed( [{id="test"}])
-- define all the allowed routes (all possible slugs)
--Article.all |> DataSource.map (List.map (\article -> RouteParams article.slug))


type alias Data =
    GlobalData


filterSpeaker : String -> Speaker -> Bool
filterSpeaker criteria sp =
    sp.s.id == criteria


data : RouteParams -> DataSource Data
data rp =
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


extractSpeaker : String -> List Speaker -> Maybe Speaker
extractSpeaker rp ls =
    List.head (List.filter (\s -> filterSpeaker rp s) ls)


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view _ _ static =
    { title = "ScalaIO - Hall of fame"
    , body =
        globalPageStructure static.data
            (View.Speakerdetails.view (extractSpeaker static.routeParams.id (List.concat [ static.data.speakers.keynote, static.data.speakers.talk ])))
    }
