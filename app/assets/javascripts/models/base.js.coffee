class FootballOps.BaseModel extends Batman.Model
    @persist Batman.RailsStorage

    constructor: ->
        super
        adapter = @_batman.get 'storage'
        adapter.defaultRequestOptions = {
            type: 'json',
            headers: {
                'Authorization': "Bearer #{FootballOps.accessToken}"
            }
        }
