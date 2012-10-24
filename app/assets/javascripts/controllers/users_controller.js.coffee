class FootballOps.UsersController extends Batman.Controller
    routingKey: 'users'
    searchQueryError: false

    index: (params) ->
        page = params.page or 1
        paginator = new FootballOps.UserPaginator page: page
        emailer = new FootballOps.UserEmailer
        emailer.setAllEmailAddresses()
        @set 'paginatedUsers', paginator
        @set 'userEmailView', new FootballOps.UserEmailerView emailer: emailer

    navigateToPage: (link) ->
        page = $(link).html() or 1
        @redirect "/users?page=#{page}"

    conferenceReps: (params) ->
        emailer = new FootballOps.UserEmailer
        emailer.setEmailAddressesForConferenceReps()
        FootballOps.User.conferenceReps (err, records) =>
            throw err if err
            @set 'users', records
            @set 'userEmailView', new FootballOps.UserEmailerView emailer: emailer

    nationalCommittee: (params) ->
        emailer = new FootballOps.UserEmailer
        emailer.setEmailAddressesForNationalCommittee()
        FootballOps.User.nationalCommittee (err, records) =>
            throw err if err
            @set 'users', records
            @set 'userEmailView', new FootballOps.UserEmailerView emailer: emailer
    
    show: (params) ->
        @set 'user', FootballOps.User.find parseInt(params.id, 10), (err) -> throw err if err

    new: (params) ->
        @set 'user', new FootballOps.User
        @set 'schools', FootballOps.School.get 'all'

    edit: (params) ->
        @set 'user', FootballOps.User.find parseInt(params.id, 10), (err) -> throw err if err
        @set 'schools', FootballOps.School.get 'all'

    create: (params) ->
        @get('user').save (err) =>
            if err
                throw err unless err instanceof Batman.ErrorsSet
            else
                FootballOps.set 'flash.success', 'New DFO successfully created!'
                @redirect FootballOps.get 'routes.users.path'

    update: (params) ->
        @get('user').save (err) =>
            if err
                throw err unless err instanceof Batman.ErrorsSet
            else
                FootballOps.set 'flash.success', "DFO #{@get 'user.full_name'} updated successfully!"
                @redirect FootballOps.get 'routes.users.path'

    destroy: ->
        user = @get 'user'
        user.destroy (err) =>
            if err
                throw err unless err instanceof Batman.ErrorsSet
            else
                FootballOps.set 'flash.error', "DFO #{user.get 'full_name'} deleted."
                @redirect FootballOps.get 'routes.users.path'

    search: (params) ->
        FootballOps.User.search params.q, (err, records) =>
            throw err if err
            @set 'searchUsers', records
