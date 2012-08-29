# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def formatted_emails(users)
	  emails = []
	  users.each do |u|
	    emails << u.email
    end
    emails.join("; ")
	end
end
