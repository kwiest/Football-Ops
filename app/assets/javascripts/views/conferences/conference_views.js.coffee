class FootballOps.ConferencesAbstractView extends Batman.View
    constructor: ->
        super
        $('#loading-spinner').spin()

    @::on 'appear', ->
        $('#loading-spinner').spin false


class FootballOps.ConferencesIndexView extends FootballOps.ConferencesAbstractView
class FootballOps.ConferencesShowView extends FootballOps.ConferencesAbstractView
