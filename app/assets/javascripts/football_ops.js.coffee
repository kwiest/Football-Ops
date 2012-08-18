# Batman.js and its adapters
#
#= require batman/es5-shim
#= require batman/batman
#= require batman/batman.jquery
#= require batman/batman.rails
#
#= require_self
#
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./helpers
#= require_tree ./views


window.FootballOps = class FootballOps extends Batman.App

    Batman.ViewStore.prefix = 'assets/views'

    # @route '/controller/:id', 'controller#show', resource: 'model', action: 'show'
    @root 'users#index'
    @resources 'users', 'schools', 'conferences', 'districts', 'divisions'
    @route '/user-search', 'users#search'

    @on 'run', ->
        user = new FootballOps.User()
        user.url = '/user_sessions/current'
        user.load (err) -> throw err if err
        @set 'currentUser', user

    @on 'ready', ->
        console?.log "FootballOps ready for use."

    @flash: Batman()
    @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
        @[key] = value
        if value isnt ''
            setTimeout =>
                @set(key, '')
            , 2000
        value

    @flashSuccess: (message) -> @set 'flash.success', message
    @flashError: (message) ->  @set 'flash.error', message
