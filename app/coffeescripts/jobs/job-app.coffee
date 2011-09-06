# Job Board Router
# People will be emailing job links, so we need to serve these assets.
class window.Router extends Backbone.Router

	initialize: (options) ->
		@jobs = new JobList options.list
		@jobListView = new JobListView collection: @jobs

	routes:
		"": "home"
		"show/:id": "showJob"

	home: =>
		$("#show-job").empty()
		
		@jobListView.render()

	showJob: (id) =>
		$("#jobs").empty()
		
		job = @jobs.get id
		view = new JobShowView model: job
		view.render()