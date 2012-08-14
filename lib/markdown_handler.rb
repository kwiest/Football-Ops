require 'rdiscount'
require 'action_view'

module ActionView
  module Template::Handlers
    class Markdown < ERB
      def initialize
      end

      def call(template)
        markdown = RDiscount.new(template.source).to_html
        erb = markdown.gsub /\{\{(.*?)\}\}/, '<%= \1 %>'
        self.class.erb_implementation.new(erb).src
      end
    end
  end
end

ActionView::Template.register_template_handler :markdown, ActionView::Template::Handlers::Markdown
