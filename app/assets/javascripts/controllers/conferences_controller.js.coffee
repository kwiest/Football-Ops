class FootballOps.ConferencesController extends Batman.Controller
    routingKey: 'conferences'
    searchQueryError: false

    index: (params) ->
        @set 'conferences', FootballOps.Conference.get 'all', (err) ->
            throw err if err

    show: (params) ->
        conference = FootballOps.Conference.find parseInt(params.id, 10), (err) ->
            throw err if err
        emailer = new FootballOps.UserEmailer model: FootballOps.User
        emailer.setEmailAddressesForConferenceUsers params.id
        @set 'conference', conference
        @set 'emailer', emailer
