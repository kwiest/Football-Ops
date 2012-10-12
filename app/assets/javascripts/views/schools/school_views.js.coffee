class FootballOps.SchoolsAbstractView extends Batman.View
    constructor: ->
        super
        $('#loading-spinner').spin()

    @::on 'appear', ->
        $('#loading-spinner').spin false


class FootballOps.SchoolsIndexView extends FootballOps.SchoolsAbstractView
class FootballOps.SchoolsShowView extends FootballOps.SchoolsAbstractView
