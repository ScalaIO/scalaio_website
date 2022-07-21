module Components.SponsorsStruct exposing (..)


import DataSource exposing (DataSource)
import DataSource.File
import Html exposing (Html)
import Json.Decode as D


type alias Sponsor =
    {
    logo:String,
    url:String,
    name:String
    }

type alias Sponsors =
    {
    platine:(List Sponsor),
    gold:(List Sponsor),
    silver:(List Sponsor)
    }

sponsorDecoder: D.Decoder Sponsor
sponsorDecoder = D.map3
        Sponsor
            (D.field "logo" D.string)
            (D.field "name" D.string )
            (D.field "url" D.string )

listSponsorDecoder: D.Decoder (List Sponsor)
listSponsorDecoder = D.list sponsorDecoder

sponsorsDecoder: D.Decoder Sponsors
sponsorsDecoder = D.map3 Sponsors
                        (D.field "platine" listSponsorDecoder )
                        (D.field "gold" listSponsorDecoder)
                        (D.field "silver" listSponsorDecoder )

data : DataSource Sponsors
data = DataSource.File.jsonFile sponsorsDecoder  "_data/sponsors.json"




view:Html msg
view = data.
