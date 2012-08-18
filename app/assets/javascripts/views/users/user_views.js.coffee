class FootballOps.UsersIndexView extends Batman.View
    constructor: ->
        super
        $('#loading-spinner').spin()

    @::on 'appear', ->
        $('#loading-spinner').spin false

class FootballOps.UsersFormView extends Batman.View
    @accessor 'isSubmitting', -> @get('context.user')?.get('lifecycle.isSaving')
    constructor: ->
        super
        @observe 'isSubmitting', (currentlySaving) =>
            inputs = $(@get 'node').find 'input'
            form   = $(@get 'node').find 'form'
            if currentlySaving
                inputs.attr 'disabled', true
                form.spin()
            else
                form.spin false
                inputs.attr 'disabled', false

class FootballOps.UsersCreateView extends FootballOps.UsersFormView
class FootballOps.UsersEditView extends FootballOps.UsersFormView
