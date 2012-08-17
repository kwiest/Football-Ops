class FootballOps.User extends Batman.Model

    @resourceName: 'user'
    @storageKey: 'api/v1/users'
    @persist Batman.RailsStorage

    @encode 'id', 'first_name', 'last_name', 'email', 'phone', 'created_at', 'updated_at', 'url',
        'conference_rep', 'national_committee', 'admin', 'conference_id', 'conference_name',
        'district_id', 'district_name', 'division_id', 'division_name', 'school_id', 'school_name'

    @accessor 'full_name', -> "#{@get 'first_name'} #{@get 'last_name'}"
