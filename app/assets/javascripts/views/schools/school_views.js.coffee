class FootballOps.SchoolsAbstractView extends Batman.View
    constructor: ->
        super
        $('#loading-spinner').spin()

    @::on 'appear', ->
        $('#loading-spinner').spin false


class FootballOps.SchoolsSearchView extends FootballOps.SchoolsAbstractView
    @accessor 'searchQuery'
    @accessor 'searchError', -> false

    constructor: ->
        super
        @set 'searchQuery', ''

    search: ->
        query = @get 'searchQuery'
        if @filterQuery query
            controller = FootballOps.get 'controllers.schools'
            controller.redirect "/school-search?q=#{query}"
            @set 'searchQuery', ''
        else
            @set 'searchError', true

    filterQuery: (query) ->
        if query and (query = query.replace(/^\s+|\s+[a-zA-Z]+$/, '')).length > 0
            true
        else
            false


class FootballOps.SchoolsIndexView extends FootballOps.SchoolsAbstractView
class FootballOps.SchoolsShowView extends FootballOps.SchoolsAbstractView
