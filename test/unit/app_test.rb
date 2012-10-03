require 'test_helper'

class AppTest < ActiveSupport::TestCase
  def setup
    @app  = apps :ios
    @user = users :kyle
  end

  # Test validations
  should validate_presence_of :name
  should validate_presence_of :description
  should validate_presence_of :website
  should validate_presence_of :redirect_uri

  # Test associations
  should belong_to :user
  should have_many :authorization_codes
  should have_many :access_tokens

  def test_creating_api_key_and_secret_on_create
    app = App.create! name: 'test', description: 'test', website: 'test', redirect_uri: 'test'
    refute_nil app.api_key, 'API Key should be generated'
    refute_nil app.api_key_secret, 'API Key Secret should be generated'
  end

  def test_create_authorization_code_for_user
    kyle  = users :kyle
    count = -> { AuthorizationCode.count }

    assert_change count do
      auth_code = @app.create_authorization_code_for_user kyle
      refute_nil auth_code, 'Returned code should not be nil'
      assert_equal @app, auth_code.app
      assert_equal kyle, auth_code.user
    end
  end

  def test_create_access_token_from_authorization_code
    auth_code = @app.create_authorization_code_for_user @user
    access_token = @app.create_access_token_from_authorization_code auth_code

    assert_equal @app, access_token.app
    assert_equal @user, access_token.user
  end
end
