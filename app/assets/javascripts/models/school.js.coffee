class FootballOps.School extends FootballOps.BaseModel

    @resourceName: 'school'
    @storageKey: 'api/v1/schools'

    @encode 'id', 'name', 'conference_id', 'district_id', 'division_id'

    @encode 'users'
        encode: false
        decode: (json) ->
            u = new FootballOps.User
            u.fromJSON(json)
            u
