class FootballOps.Conference extends FootballOps.BaseModel

    @resourceName: 'conference'
    @storageKey: 'api/v1/conferences'

    @encode 'id', 'name', 'user_ids'

    @accessor 'users', ->
        users_array = []
        user_ids = @get 'user_ids'
        for id in user_ids
            user = FootballOps.User.find id, (err) -> throw err if err
            users_array.push user
        users_array

