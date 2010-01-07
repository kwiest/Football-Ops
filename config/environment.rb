RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  # AuthLogic
  config.gem 'authlogic'
  
  # Paperclip
  config.gem 'paperclip'
  
  # Thoughtbot Factory Girl
  config.gem 'thoughtbot-factory_girl', :lib => 'factory_girl'
  
  # Formtastic
  config.gem 'formtastic'
  
  # Time Zone
  config.time_zone = 'Pacific Time (US & Canada)'
end