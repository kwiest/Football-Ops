class FootballOps.ConferencesController extends Batman.Controller
    routingKey: 'conferences'
    searchQueryError: false

    index: (params) ->
        @set 'conferences', FootballOps.Conference.get 'all', (err) ->
            throw err if err

    show: (params) ->
        conference = FootballOps.Conference.find parseInt(params.id, 10), (err) ->
            throw err if err
        @set 'conference', conference
