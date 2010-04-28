RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  config.gem 'authlogic'
  config.gem 'paperclip'
  config.gem 'formtastic'
  config.gem 'canable'
  config.gem 'aws-s3'
  
  config.time_zone = 'Pacific Time (US & Canada)'
end