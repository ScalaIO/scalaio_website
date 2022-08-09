module View.CodeOfConduct exposing (view)

import Html exposing (Html, a, div, h2, h3, li, p, text, ul)
import Html.Attributes exposing (class, href, target)


view : Html msg
view =
    div [ class "centered-body" ]
        [ h2 [ class "centered-body-title" ] [ text "Code of conduct" ]
        , p [] [ text "ScalaIO is an all-ages event for people from many different backgrounds. We expect presenters, exhibitors, and attendees to help make ScalaIO enjoyable for everyone, regardless of age, gender, sexuality, religious or ethnic identity, or ability." ]
        , h3 [ class "faq-sub-title" ] [ text "All attendees" ]
        , p [] [ text "Please show respect for all attendees. In particular:" ]
        , ul [ class "list" ]
            [ li [] [ text "Offensive behavior such as verbal abuse, intimidation, or harassment will not be tolerated." ]
            , li [] [ text "Offensive behavior such as verbal abuse, intimidation, or harassment will not be tolerated." ]
            , li [] [ text "Remember that all our attendees are here for similar reasons, and do not make assumptions about anyone's interests, skill level, or profession based on their appearance or background." ]
            , li [] [ text "Remember that \"no means no\". If someone asks you to stop speaking about a particular subject, or to leave them alone, please do so." ]
            , li [] [ text "There are many parties associated with ScalaIO, and these guidelines apply equally there. Please consume alcohol responsibly." ]
            , li [] [ text "Support your friends and colleagues. If you see someone behaving badly, please let them know that you're not OK with it." ]
            ]
        , h3 [ class "faq-sub-title" ] [ text "Speakers" ]
        , p [] [ text "Please ensure that your presentation does not stigmatize, alienate, or marginalize any individual or group. In particular:" ]
        , ul [ class "list" ]
            [ li [] [ text "Keep your slide deck G-rated." ]
            , li [] [ text "Anything beyond the occasional mild cuss word is not appropriate." ]
            , li [] [ text "While criticism of software, programming practices, etc, is OK, please try to offer constructive improvements or alternatives as part of your talk." ]
            , li [] [ text "Personal criticism and ad hominem attacks are never OK." ]
            ]
        , h3 [ class "faq-sub-title" ] [ text "Exhibitors" ]
        , p [] [ text "ScalaIO is an all-ages, mixed-gender event. Please make sure your booth and party can be enjoyed by everyone. In particular, overtly sexualized booths or parties, including \"booth babes\" or hired entertainers in provocative/sexy attire, are not appropriate." ]
        , h3 [ class "faq-sub-title" ] [ text "Please contact us" ]
        , p [] [ text "To discuss any incidents or behavior in violation of this code of conduct, please contact one of the organizers, at the booth, by phone or by email." ]
        , p [] [ text "We will take any complaints seriously, and respond appropriately. Attendees, speakers, or exhibitors who violate this Code of Conduct may be asked to remedy their behavior, apologize, leave the event, or may be banned from future events." ]
        , p [] [ text "If you're unsure whether your presentation, booth, or party will be enjoyed by all, please check with the organizers: ", a [ href "mailto:cfp@scala.io", target "_blank" ] [ text "cfp@scala.io" ], text "." ]
        , p [] [ text "This code of conduct is adapted from ", a [ href "http://geekfeminism.wikia.com/wiki/Event_Guidelines", target "_blank" ] [ text "http://geekfeminism.wikia.com/wiki/Event_Guidelines" ], text "." ]
        ]
