class FootballOps.District extends FootballOps.BaseModel

    @resourceName: 'district'
    @storageKey: 'api/v1/districts'

    @encode 'id', 'name', 'user_ids'

    @accessor 'users', ->
        users_array = []
        user_ids = @get 'user_ids'
        return [] unless user_ids?
        for id in user_ids
            user = FootballOps.User.find id, (err) -> throw err if err
            users_array.push user
        users_array
