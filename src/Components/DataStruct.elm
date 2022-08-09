module Components.DataStruct exposing (..)

import DataSource exposing (DataSource)
import DataSource.File
import OptimizedDecoder as D


type SponsorKind
    = Platine
    | Gold
    | Silver
    | JaimeScala


computeCss : SponsorKind -> String
computeCss k =
    case k of
        Platine ->
            "sponsors-platine-logo"

        Gold ->
            "sponsors-gold-logo"

        Silver ->
            "sponsors-silver-logo"

        JaimeScala ->
            "sponsors-jaimescala-logo"


type alias Sponsor =
    { url : String
    , name : String
    }


type alias Sponsors =
    { platine : List Sponsor
    , gold : List Sponsor
    , silver : List Sponsor
    , jaimeScala : List Sponsor
    }


type alias Contributor =
    { name : String
    , twitter : Maybe String
    , company : String
    }


type alias Contribution =
    { year : Int
    , contributors : List Contributor
    }


type alias GlobalData =
    { sponsors : Sponsors
    , contributions : List Contribution
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
    D.map4 Sponsors
        (D.field "platine" listSponsorDecoder)
        (D.field "gold" listSponsorDecoder)
        (D.field "silver" listSponsorDecoder)
        (D.field "jaimescala" listSponsorDecoder)


contributorDecoder : D.Decoder Contributor
contributorDecoder =
    D.map3 Contributor
        (D.field "name" D.string)
        (D.optionalField "twitter" D.string)
        (D.field "company" D.string)


contributorsDecoder : D.Decoder (List Contributor)
contributorsDecoder =
    D.list contributorDecoder


contributionDecoder : D.Decoder Contribution
contributionDecoder =
    D.map2 Contribution
        (D.field "year" D.int)
        (D.field "contributors" contributorsDecoder)


contributionsDecoder : D.Decoder (List Contribution)
contributionsDecoder =
    D.list contributionDecoder


globalData : D.Decoder GlobalData
globalData =
    D.map2 GlobalData
        (D.field "sponsors" sponsorsItemDecoder)
        (D.field "contributions" contributionsDecoder)


data : DataSource GlobalData
data =
    DataSource.File.jsonFile globalData "_data/scalaIO_data.json"
