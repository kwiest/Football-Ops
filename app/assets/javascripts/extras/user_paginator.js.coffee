class FootballOps.UserPaginator extends Batman.ModelPaginator
    model: FootballOps.User
    limit: 25

    constructor: ->
        super
        @setTotalCount()

    setTotalCount: ->
        self = this
        @model.request 'total_count', (err, responseJSON) ->
            throw err if err
            self.set 'totalCount', responseJSON['count']

    onFirstPage: @get('page') == 1
    #onFirstPage: =>
        #@get('page') == 1

    onLastPage: @get('page') == @get('pageCount')
    #onLastPage: =>
        #@get('page') == @pageCount()
