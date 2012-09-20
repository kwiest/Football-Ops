require 'test_helper'

class AppTest < ActiveSupport::TestCase
  def setup
    @app = apps :ios
  end

  # Test validations
  should validate_presence_of :name
  should validate_presence_of :description
  should validate_presence_of :website
  should validate_presence_of :redirect_uri

  # Test associations
  should belong_to :user

  def test_creating_api_key_and_secret_on_create
    app = App.create! name: 'test', description: 'test', website: 'test', redirect_uri: 'test'
    refute app.api_key.nil?, 'API Key should be generated'
    refute app.api_key_secret.nil?, 'API Key Secret should be generated'
  end
end
