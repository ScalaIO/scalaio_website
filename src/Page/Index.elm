module Page.Index exposing (Model, Data, Msg, page)


import Components.DataStruct as DataStruct exposing (GlobalData, Sponsor)
import Components.WebSiteStruct exposing (globalPageStructure)
import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Page exposing (Page, StaticPayload, PageWithState)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared exposing (Msg(..))
import View exposing (View)

import View.Home


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


data : DataSource Data
data = DataStruct.data


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "ScalaIO"
        , image =
            { url = Pages.Url.external "https://scalaio-teasing.cleverapps.io/assets/images/favicon.png"
            , alt = "scalaIO logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "ScalaIO - Home page"
        , locale = Nothing
        , title = "Scala IO" -- metadata.title -- TODO
        }
        |> Seo.website


type alias Data = GlobalData




view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = "ScalaIO - Home"
        , body = globalPageStructure static.data View.Home.view
    }


--update : PageUrl -> Maybe Browser.Navigation.Key -> Shared.Model -> StaticPayload Data RouteParams -> Shared.Msg -> ( Shared.Model, Cmd Msg )
--update maybeUrl _ sharedModel static msg =
 --   case msg of
--        DropDownMsg m ->
 --           ( { sharedModel | dropdown = DropDown.update m sharedModel.dropdown }, Cmd.none )
