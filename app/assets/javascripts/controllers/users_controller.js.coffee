class FootballOps.UsersController extends Batman.Controller
    routingKey: 'users'

    index: (params) ->
        FootballOps.User.load (err) -> throw err if err
        @set 'users', FootballOps.User.get 'all'
    
    show: (params) ->
        @set 'user', FootballOps.User.find parseInt(params.id, 10), (err) ->
            throw err if err

    create: (params) ->

    update: (params) ->

    destroy: (params) ->
    
