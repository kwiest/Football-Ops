class FootballOps.User extends Batman.Model

    @resourceName: 'user'
    @storageKey: 'api/v1/users'
    @persist Batman.RailsStorage

    @encode 'id', 'first_name', 'last_name', 'email', 'phone', 'created_at', 'updated_at', 'url',
        'conference_rep', 'national_committee', 'admin', 'conference_id', 'conference_name',
        'district_id', 'district_name', 'division_id', 'division_name', 'school_id', 'school_name'

    @accessor 'full_name', -> "#{@get 'first_name'} #{@get 'last_name'}"

    @accessor 'canManage', ->
        currentUser = FootballOps.get 'currentUser'
        return true if currentUser.get('id') == @get('id')
        return true if currentUser.get('admin') == true
        return true if currentUser.get('conference_rep') == true
        return true if currentUser.get('national_committee') == true
        false

    @accessor 'canAdminister', ->
        currentUser = FootballOps.get 'currentUser'
        return true if currentUser.get('admin') == true
        return true if currentUser.get('conference_rep') == true
        return true if currentUser.get('national_committee') == true
        false

    @validate 'first_name', 'last_name', 'email', 'school_id', presence: true

    @search: (query, callback) ->
        @request 'search', { data: { q: query } }, (err, responseJSON) ->
            unless err
                records = for blob in responseJSON
                    record = new FootballOps.User
                    record.fromJSON blob
                    record
            callback err, records
