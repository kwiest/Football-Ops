FootballOpsApp.template = (selector) ->
	template = null
	->
		template ?= Handlebars.compile(if selector.charAt(0) == '#' then $(selector).html() else selector)
		template.apply this, arguments