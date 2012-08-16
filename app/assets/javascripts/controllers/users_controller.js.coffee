class FootballOps.UsersController extends Batman.Controller
    routingKey: 'users'

    index: (params) ->
        FootballOps.User.load (err) -> throw err if err
        @set 'users', FootballOps.User.get 'all'
    
    show: (params) ->

    create: (params) ->

    update: (params) ->

    destroy: (params) ->
    
