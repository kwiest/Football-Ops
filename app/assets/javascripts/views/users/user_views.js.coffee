class FootballOps.UsersAbstractView extends Batman.View
    constructor: ->
        super
        $('#loading-spinner').spin()

    @::on 'appear', ->
        $('#loading-spinner').spin false


class FootballOps.UsersFormView extends FootballOps.UsersAbstractView
    @accessor 'isSubmitting', -> @get('context.user')?.get('lifecycle.isSaving')
    constructor: ->
        super
        @observe 'isSubmitting', (currentlySaving) =>
            inputs = $(@get 'node').find 'input'
            form   = $(@get 'node').find 'form'
            if currentlySaving
                inputs.attr 'disabled', true
                form.spin()
            else
                form.spin false
                inputs.attr 'disabled', false


class FootballOps.UsersSearchView extends FootballOps.UsersAbstractView
    @accessor 'searchQuery'
    @accessor 'searchError', -> false

    constructor: ->
        super
        @set 'searchQuery', ''

    search: ->
        query = @get 'searchQuery'
        if @filterQuery query
            controller = FootballOps.get 'controllers.users'
            controller.redirect "/user-search?q=#{query}"
            @set 'searchQuery', ''
        else
            @set 'searchError', true

    filterQuery: (query) ->
        if query and (query = query.replace(/^\s+|\s+[a-zA-Z]+$/, '')).length > 0
            true
        else
            false


class FootballOps.UsersIndexView extends FootballOps.UsersAbstractView
class FootballOps.UsersConferenceRepsView extends FootballOps.UsersAbstractView
class FootballOps.UsersNationalCommitteeView extends FootballOps.UsersAbstractView

class FootballOps.UsersNewView extends FootballOps.UsersFormView
class FootballOps.UsersEditView extends FootballOps.UsersFormView
