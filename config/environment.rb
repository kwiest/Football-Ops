RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  config.gem 'authlogic', :version => '2.1.3'
  config.gem 'formtastic', :version => '0.9.8'
  config.gem 'inherited_resources', :version => '1.0.6'
  config.gem 'responders', :version => '0.4.7'
  config.gem 'will_paginate', :version => '2.3.12'
  
  config.time_zone = 'Pacific Time (US & Canada)'
end
