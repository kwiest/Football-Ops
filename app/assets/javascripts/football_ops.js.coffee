window.FootballOps = class FootballOps extends Batman.App

    Batman.ViewStore.prefix = 'assets/views'

    @root 'users#index'
    # @route '/controller/:id', 'controller#show', resource: 'model', action: 'show'
    @resources 'users', 'schools', 'conferences', 'districts', 'divisions'

    @on 'run', ->
        console?.log "Running ...."

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
