require 'rdiscount'
require 'action_view'

module MarkdownRails
  class Handler
    def initialize
    end

    def call(template)
      RDiscount.new(template.source).to_html.inspect + '.html_safe'
    end
  end
end

handler = MarkdownRails::Handler.new
ActionView::Template.register_template_handler :markdown, handler
