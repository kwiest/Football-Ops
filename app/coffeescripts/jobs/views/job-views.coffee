# Job Show View
class window.JobShowView extends Backbone.View
	el: "#show-job"

	events:
		"click .close": "close"

	render: =>
		$(@el).html JST.show @model.toJSON()
		this

	close: =>
		$(@el).empty()
		router.navigate "", true
		false


# Job Index View
class window.JobListView extends Backbone.View
	el: "#jobs"

	initialize: ->
		@collection.bind "add", @render
		@collection.bind "remove", @render

	render: =>
		$(@el).empty()
	
		els = @collection.map (job) ->
			view = new JobListItemView model: job
			view.render().el

		$(@el).append els
		this
	

# Job List Item View
class window.JobListItemView extends Backbone.View
	tagName: "li"
	className: "job"
	
	events:
		"click .show-job": "show"

	initialize: ->
		@model.bind "change", @render
	
	render: =>
		$(@el).html JST.list_item @model.toJSON()
		this
	
	show: =>
		router.navigate "show/#{@model.get('id')}", true
		false
		
