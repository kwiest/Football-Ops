class FootballOps.UsersController extends Batman.Controller
    routingKey: 'users'
    searchQueryError: false

    index: (params) ->
        paginator = new FootballOps.UserPaginator
        @set 'paginatedUsers', paginator
    
    show: (params) ->
        @set 'user', FootballOps.User.find parseInt(params.id, 10), (err) -> throw err if err

    new: (params) ->
        @set 'user', new FootballOps.User

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

    submitSearch: (form) =>
        searchQuery = $(form).find('#user-query').val()
        @redirect "/user-search?q=#{searchQuery}"

    search: (params) ->
        if params.q && (params.q = params.q.replace(/^\s+|\s+$/g,'')).length > 0
            @set 'searchQueryError', false
            @set 'searchQuery', params.q
            @set 'searchUsers', null

            FootballOps.User.search params.q, (err, records) =>
                throw err if err
                @set 'searchUsers', records
        else
            @set 'searchQueryError', true

