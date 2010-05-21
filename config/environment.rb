RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  config.gem 'authlogic', :version => '2.1.3'
  config.gem 'formtastic', :version => '0.9.8'
  config.gem 'inherited_resources', :version => '1.0.6'
  config.gem 'will_paginate', :version => '2.3.12'
  config.gem 'searchlogic', :version => '2.4.19'
  config.gem 'mad_mimi_mailer', :version => '0.1.2.1'
  config.gem 'aws-s3', :version => '0.6.2', :lib => 'aws/s3'
  
  config.time_zone = 'Pacific Time (US & Canada)'
end

MadMimiMailer.api_settings = {
  :username => "kyle.wiest@gmail.com",
  :api_key => "19b119009045535fca3b1e720077fae3"
}
