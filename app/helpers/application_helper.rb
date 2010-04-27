# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def navigation(*links)
		items = []
		
		if @active_tab == :index
			items << content_tag(:li, link_to("Home", root_path, :class => "selected"))
		else
			items << content_tag(:li, link_to("Home", root_path))
		end
		
		links.each do |link|
			if(controller_name.to_sym == link)
				items << content_tag(:li, link_to("#{link.to_s.humanize}", link, :class => "selected"))
			else
				items << content_tag(:li, link_to("#{link.to_s.humanize}", link))
			end
		end
		
		items << content_tag(:li, link_to("AFCA Convention"))
		items << content_tag(:li, link_to("Conference Reps"))
		items << content_tag(:li, link_to("National Committee"))
		
		content_tag :ul, items, :id => "nav"
	end
end
