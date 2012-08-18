class FootballOps.UsersController extends Batman.Controller
    routingKey: 'users'

    index: (params) ->
        FootballOps.User.load (err) -> throw err if err
        @set 'users', FootballOps.User.get 'all'
    
    show: (params) ->
        @set 'user', FootballOps.User.find parseInt(params.id, 10), (err) -> throw err if err

    new: (params) ->
        @set 'user', new FootballOps.User()

    edit: (params) ->
        @set 'user', FootballOps.User.find parseInt(params.id, 10), (err) -> throw err if err
        @set 'schools', FootballOps.School.get 'all'

    create: (params) ->

    update: (params) ->
        @get('user').save (err) =>
            if err
                throw err unless err instanceof Batman.ErrorSet
            else
                FootballOps.set 'flash.success', "User #{@get 'user.full_name'} updated successfully!"
                @redirect FootballOps.get 'routes.users.path'


    destroy: (params) ->
    
