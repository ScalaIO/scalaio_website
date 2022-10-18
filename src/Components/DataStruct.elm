module Components.DataStruct exposing (..)

import DataSource exposing (DataSource)
import DataSource.File
import OptimizedDecoder as D


type SponsorKind
    = Platine
    | Gold
    | Community
    | Silver
    | JaimeScala


computeCssSponsor : SponsorKind -> String
computeCssSponsor k =
    case k of
        Platine ->
            "sponsors-platine-logo"

        Gold ->
            "sponsors-gold-logo"

        Community ->
            "sponsors-community-logo"

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
    , community : List Sponsor
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


type alias SpeakerData =
    { name : String
    , title : String
    , speakerTitle : String
    , id : String
    , bio : String
    , organization : String
    }


type alias SpeakerTalk =
    { talk_format : String
    , description : String
    , abstract : String
    , audience_level : String
    }


type alias Speaker =
    { s : SpeakerData
    , t : SpeakerTalk
    }


type alias Speakers =
    { keynote : List Speaker
    , talk : List Speaker
    }


type Type
    = Single
    | Double
    | Lunch
    | AfterLunch


type alias ScheduleItem =
    { typ : Type
    , time : String
    , items : List String
    }


type alias Schedule =
    { items : List ScheduleItem
    }


decodeType : D.Decoder Type
decodeType =
    D.string
        |> D.andThen
            (\s ->
                case s of
                    "Single" ->
                        D.succeed Single

                    "Double" ->
                        D.succeed Double

                    "Lunch" ->
                        D.succeed Lunch

                    "AfterLunch" ->
                        D.succeed AfterLunch

                    _ ->
                        D.fail "Type in Schedule not defined"
            )


sheduleItemDecoder : D.Decoder ScheduleItem
sheduleItemDecoder =
    D.map3 ScheduleItem
        (D.field "typ" decodeType)
        (D.field "time" D.string)
        (D.field "items" (D.list D.string))


listScheduleItemDecoder : D.Decoder (List ScheduleItem)
listScheduleItemDecoder =
    D.list sheduleItemDecoder


type alias Workshop =
    { title : String
    , trainer : String
    , photo : String
    , description : String
    , nbPlaces : String
    , lang : String
    , link : String
    }


type alias WorkshopData =
    { address : String
    , horaires : String
    , workshops : List Workshop
    }


type alias GlobalData =
    { sponsors : Sponsors
    , contributions : List Contribution
    , speakers : Speakers
    , schedule : List ScheduleItem
    , ws : WorkshopData
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
    D.map5 Sponsors
        (D.field "platine" listSponsorDecoder)
        (D.field "gold" listSponsorDecoder)
        (D.field "community" listSponsorDecoder)
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


talkDecoder : D.Decoder SpeakerTalk
talkDecoder =
    D.map4 SpeakerTalk
        (D.field "talk_format" D.string)
        (D.field "description" D.string)
        (D.field "abstract" D.string)
        (D.field "audience_level" D.string)


speakerDataDecoder : D.Decoder SpeakerData
speakerDataDecoder =
    D.map6 SpeakerData
        (D.field "name" D.string)
        (D.field "title" D.string)
        (D.field "speaker-title" D.string)
        (D.field "id" D.string)
        (D.field "bio" D.string)
        (D.field "organization" D.string)


speakerDecoder : D.Decoder Speaker
speakerDecoder =
    D.map2 Speaker
        speakerDataDecoder
        talkDecoder


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


workshopDecoder : D.Decoder Workshop
workshopDecoder =
    D.map7 Workshop
        (D.field "title" D.string)
        (D.field "trainer" D.string)
        (D.field "photo" D.string)
        (D.field "description" D.string)
        (D.field "nbPlaces" D.string)
        (D.field "lang" D.string)
        (D.field "link" D.string)


workshopsDecoder : D.Decoder (List Workshop)
workshopsDecoder =
    D.list workshopDecoder


workshopData : D.Decoder WorkshopData
workshopData =
    D.map3 WorkshopData
        (D.field "address" D.string)
        (D.field "horaires" D.string)
        (D.field "workshops" workshopsDecoder)


globalData : D.Decoder GlobalData
globalData =
    D.map5 GlobalData
        (D.field "sponsors" sponsorsItemDecoder)
        (D.field "contributions" contributionsDecoder)
        (D.field "speakers" speakersDecoder)
        (D.field "schedule" listScheduleItemDecoder)
        (D.field "workshopData" workshopData)


data : DataSource GlobalData
data =
    DataSource.File.jsonFile globalData "_data/scalaIO_data.json"


dataSpeaker : DataSource (List Speaker)
dataSpeaker =
    DataSource.File.jsonFile globalData "_data/scalaIO_data.json" |> DataSource.map (\d -> List.concat [ d.speakers.talk, d.speakers.keynote ])
