class FootballOps.School extends FootballOps.BaseModel

    @resourceName: 'school'
    @storageKey: 'api/v1/schools'

    @encode 'id', 'name', 'address_street', 'address_city_state_zip', 'user_ids',
        'conference_id', 'conference_name',
        'district_id', 'district_name',
        'division_id', 'division_name'

    @accessor 'users', ->
        users_array = []
        user_ids = @get 'user_ids'
        return [] unless user_ids?
        for id in user_ids
            user = FootballOps.User.find id, (err) -> throw err if err
            users_array.push user
        users_array

    @search: (query, callback) ->
        @request 'search', { data: { q: query } }, (err, responseJSON) =>
            unless err
                records = for blob in responseJSON
                    school = new FootballOps.School
                    school.fromJSON blob
                    school
                callback err, records
