class FootballOps.School extends FootballOps.BaseModel

    @resourceName: 'school'
    @storageKey: 'api/v1/schools'

    @encode 'id', 'name', 'address_street', 'address_city_state_zip',
        'conference_id', 'conference_name',
        'district_id', 'district_name',
        'division_id', 'division_name'

    @encode 'users'
        encode: false
        decode: (json) ->
            users_array = []
            for user_id in json
                u = FootballOps.User.find user_id, (err) -> throw err if err
                users_array.push u
            users_array
