class FootballOps.UserEmailer extends Batman.Object
    model: FootballOps.User

    setAllEmailAddresses: ->
        self = this
        @model.request 'email_addresses', (err, responseJSON) ->
            throw err if err
            self.set 'emailAddresses', responseJSON['email_addresses']

    setEmailAddressesForGroup: (group_type, group_id) ->
        self = this
        @model.request "email_addresses_by_#{group_type}/#{group_id}", (err, responseJSON) ->
            throw err if err
            self.set 'emailAddresses', responseJSON['email_addresses']
