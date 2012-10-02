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
  should have_many :authorization_codes

  def test_creating_api_key_and_secret_on_create
    app = App.create! name: 'test', description: 'test', website: 'test', redirect_uri: 'test'
    refute_nil app.api_key, 'API Key should be generated'
    refute_nil app.api_key_secret, 'API Key Secret should be generated'
  end

  def test_create_authorization_code!
    count = -> { AuthorizationCode.count }
    assert_change count do
      auth_code = @app.create_authorization_code!
      refute_nil auth_code, 'Returned code should not be nil'
    end
  end
end
