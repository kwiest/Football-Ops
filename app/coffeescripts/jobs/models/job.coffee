# User Model
class window.User extends Backbone.Model


# Job Model
class window.Job extends Backbone.Model
	can_user_edit: (user) ->
		@attributes.user_id == user.id


# Job Collection
class window.JobList extends Backbone.Collection
	url: "/jobs"
	model: Job

	comparator: (job) ->
		job.get "created_at"