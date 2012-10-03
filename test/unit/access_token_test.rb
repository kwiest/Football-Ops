require 'test_helper'

class AccessTokenTest < ActiveSupport::TestCase
  # Test validations
  should validate_presence_of :app
  should validate_presence_of :user

  # Test associations
  should belong_to :app
  should belong_to :user

  def setup
    @app  = apps :ios
    @user = users :kyle
  end

  def test_generate_token_on_create
    access_token = AccessToken.create! app: @app, user: @user

    refute_nil access_token.token
  end

  def test_destroy_old_tokens
    4.times { AccessToken.create! app: @app, user: @user }
    assert_equal 4, AccessToken.where(app_id: @app, user_id: @user).size

    AccessToken.destroy_old_tokens @app, @user
    assert_equal 0, AccessToken.where(app_id: @app, user_id: @user).size
  end

  def test_create_from_authorization_code
    auth_code = @app.create_authorization_code_for_user @user

    AccessToken.expects :destroy_old_tokens
    access_token = AccessToken.create_from_authorization_code auth_code

    assert_equal @app, access_token.app
    assert_equal @user, access_token.user
  end

  def test_creating_with_an_expired_authorization_code
    auth_code = stub expired?: true
    assert_raise AuthorizationCodeExpiredError do
      AccessToken.create_from_authorization_code auth_code
    end
  end
end
