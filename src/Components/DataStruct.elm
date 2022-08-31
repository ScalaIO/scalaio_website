module Components.DataStruct exposing (..)

import DataSource exposing (DataSource)
import DataSource.File
import OptimizedDecoder as D


type SponsorKind
    = Platine
    | Gold
    | Silver
    | JaimeScala


computeCssSponsor : SponsorKind -> String
computeCssSponsor k =
    case k of
        Platine ->
            "sponsors-platine-logo"

        Gold ->
            "sponsors-gold-logo"

        Silver ->
            "sponsors-silver-logo"

        JaimeScala ->
            "sponsors-jaimescala-logo"


computeCssSpeaker : KindTalk -> String
computeCssSpeaker k =
    case k of
        Keynote ->
            "speakers-keynote-picture"

        Talk ->
            "speakers-talk-picture"


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


type KindTalk
    = Keynote
    | Talk


type alias Speaker =
    { name : String
    , title : String
    , picture : String
    }


type alias Speakers =
    { keynote : List Speaker
    , talk : List Speaker
    }


type alias GlobalData =
    { sponsors : Sponsors
    , contributions : List Contribution
    , speakers : Speakers
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


speakerDecoder : D.Decoder Speaker
speakerDecoder =
    D.map3 Speaker
        (D.field "name" D.string)
        (D.field "title" D.string)
        (D.field "picture" D.string)


listSpeakerDecoder : D.Decoder (List Speaker)
listSpeakerDecoder =
    D.list speakerDecoder


speakersDecoder : D.Decoder Speakers
speakersDecoder =
    D.map2 Speakers
        (D.field "keynote" listSpeakerDecoder)
        (D.field "talk" listSpeakerDecoder)


contributionsDecoder : D.Decoder (List Contribution)
contributionsDecoder =
    D.list contributionDecoder


globalData : D.Decoder GlobalData
globalData =
    D.map3 GlobalData
        (D.field "sponsors" sponsorsItemDecoder)
        (D.field "contributions" contributionsDecoder)
        (D.field "speakers" speakersDecoder)


data : DataSource GlobalData
data =
    DataSource.File.jsonFile globalData "_data/scalaIO_data.json"

dataSpeaker : DataSource GlobalData
dataSpeaker =
    DataSource.File.jsonFile globalData "_data/speaker_details.json"
