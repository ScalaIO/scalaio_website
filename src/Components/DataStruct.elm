module Components.DataStruct exposing (..)

import DataSource exposing (DataSource)
import DataSource.File
import OptimizedDecoder as D


type SponsorKind
    = Platine
    | Gold
    | Silver


computeCss : SponsorKind -> String
computeCss k =
    case k of
        Platine ->
            "sponsors-platine-logo"

        Gold ->
            "sponsors-gold-logo"

        Silver ->
            "sponsors-silver-logo"


type alias Sponsor =
    { url : String
    , name : String
    }


type alias Sponsors =
    { platine : List Sponsor
    , gold : List Sponsor
    , silver : List Sponsor
    }


type alias GlobalData =
    { sponsors : Sponsors
    }


sponsorDecoder : D.Decoder Sponsor
sponsorDecoder =
    D.map2 Sponsor
        (D.field "url" D.string)
        (D.field "name" D.string)


listSponsorDecoder : D.Decoder (List Sponsor)
listSponsorDecoder =
    D.list sponsorDecoder


sponsorsItemDecoder : D.Decoder Sponsors
sponsorsItemDecoder =
    D.map3 Sponsors
        (D.field "platine" listSponsorDecoder)
        (D.field "gold" listSponsorDecoder)
        (D.field "silver" listSponsorDecoder)


globalData : D.Decoder GlobalData
globalData =
    D.map GlobalData
        (D.field "sponsors" sponsorsItemDecoder)


data : DataSource GlobalData
data =
    DataSource.File.jsonFile globalData "_data/scalaIO_data.json"
