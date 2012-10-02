ENV["RAILS_ENV"] = "test"
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara/rails'
require 'mocha'

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  require_relative './support/integration_helpers'

  include Capybara::DSL
  include IntegrationHelpers
end
