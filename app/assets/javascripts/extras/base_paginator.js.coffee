class FootballOps.BasePaginator extends Batman.ModelPaginator
    limit: 25

    constructor: (params) ->
        super
        @setTotalCount()

    setTotalCount: ->
        self = this
        @model.request 'total_count', (err, responseJSON) ->
            throw err if err
            self.set 'totalCount', responseJSON['count']

    @accessor 'pages', -> [1..@get('pageCount')]

    nextPage: ->
        if @get 'onLastPage'
            @set('onFirstPage', false) unless @get('page') is 1
        else
            @set('page', @get('page') + 1) unless @get('onLastPage')
            @set('onLastPage', true) unless @get('page') isnt @get('pageCount')
        @get 'page'

    previousPage: ->
        if @get 'onFirstPage'
            @set('onLastPage', false) unless @get('page') is @get('pageCount')
        else
            @set('page', @get('page') - 1)
            @set('onFirstPage', true) unless @get('page') isnt 1
        @get 'page'

    loadItemsForOffsetAndLimit: (offset, limit) ->
        params = { 'page': @get('page'), 'limit': limit }
        @model.load params, (err, records) =>
            if err?
                @markAsFinishedLoading()
                @fire 'error', err
            else
                @updateCache offset, limit, records
