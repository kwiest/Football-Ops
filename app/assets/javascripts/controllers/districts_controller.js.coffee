class FootballOps.DistrictsController extends Batman.Controller
    routingKey: 'districts'

    index: (params) ->
        @set 'districts', FootballOps.District.get 'all', (err) ->
            throw err if err

    show: (params) ->
        district = FootballOps.District.find parseInt(params.id, 10), (err) ->
            throw err if err
        emailer = new FootballOps.UserEmailer
        emailer.setEmailAddressesForGroup 'district', params.id
        @set 'district', district
        @set 'userEmailView', new FootballOps.UserEmailerView emailer: emailer
