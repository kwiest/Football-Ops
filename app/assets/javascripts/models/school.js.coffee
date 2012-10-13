class FootballOps.School extends FootballOps.BaseModel

    @resourceName: 'school'
    @storageKey: 'api/v1/schools'

    @encode 'id', 'name', 'address_street', 'address_city_state_zip',
        'conference_id', 'district_id', 'division_id'

    @encode 'users'
        encode: false
        decode: (json) ->
            u = new FootballOps.User
            u.fromJSON(json)
            u
