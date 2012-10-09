class FootballOps.User extends Batman.Model

    @resourceName: 'user'
    @storageKey: 'api/v1/users'
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

    @encode 'id', 'first_name', 'last_name', 'email', 'phone', 'fax',
        'password', 'password_confirmation', 'url',
        'conference_rep', 'national_committee', 'admin',
        'conference_id', 'conference_name',
        'district_id', 'district_name',
        'division_id', 'division_name', 'school_id', 'school_name'

    @encode 'created_at', 'updated_at', Batman.Encoders.railsDate

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

    @conferenceReps: (callback) ->
        @request 'conference_reps', {}, (err, responseJSON) ->
            unless err
                records = for blob in responseJSON
                    record = new FootballOps.User
                    record.fromJSON blob
                    record
                callback err, records

    @nationalCommittee: (callback) ->
        @request 'national_committee', {}, (err, responseJSON) ->
            unless err
                records = for blob in responseJSON
                    record = new FootballOps.User
                    record.fromJSON blob
                    record
                callback err, records

    @search: (query, callback) ->
        @request 'search', { data: { q: query } }, (err, responseJSON) =>
            unless err
                records = for blob in responseJSON
                    record = new FootballOps.User
                    record.fromJSON blob
                    record
                callback err, records
