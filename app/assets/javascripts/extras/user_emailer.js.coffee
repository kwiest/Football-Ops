class FootballOps.UserEmailer extends Batman.Object
    model: FootballOps.User

    setAllEmailAddresses: ->
        self = this
        @model.request 'email_addresses', (err, responseJSON) ->
            throw err if err
            self.set 'emailAddresses', responseJSON['email_addresses']

    setEmailAddressesForConferenceUsers: (conference_id) ->
        self = this
        @model.request "email_addresses_by_conference/#{conference_id}", (err, responseJSON) ->
            throw err if err
            self.set 'emailAddresses', responseJSON['email_addresses']
