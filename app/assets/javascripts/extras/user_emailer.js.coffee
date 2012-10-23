class FootballOps.UserEmailer extends Batman.Object
    setAllEmailAddresses: ->
        self = this
        @model.request 'email_addresses', (err, responseJSON) ->
            throw err if err
            self.set 'emailAddresses', responseJSON['email_addresses']
