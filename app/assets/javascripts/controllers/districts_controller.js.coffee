class FootballOps.DistrictsController extends Batman.Controller
    routingKey: 'districts'

    index: (params) ->
        @set 'districts', FootballOps.District.get 'all', (err) ->
            throw err if err

    show: (params) ->
        district = FootballOps.District.find parseInt(params.id, 10), (err) ->
            throw err if err
        @set 'district', district
