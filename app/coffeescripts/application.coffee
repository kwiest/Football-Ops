$ ->
	
	# Navigation Drop-down Menu
	$("body").bind "click", (e) ->
		$("a.menu").parent("li").removeClass "open"
	
	$("a.menu").click (e) ->
		$(this).parent("li").toggleClass "open"
		# $(this).next("ul").show()
		false