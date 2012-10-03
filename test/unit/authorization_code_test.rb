require 'test_helper'

class AuthorizationCodeTest < ActiveSupport::TestCase
  # Test validations
  should validate_presence_of :app
  should validate_presence_of :user

  # Test associations
  should belong_to :app
  should belong_to :user

  def setup
    app  = apps :ios
    user = users :kyle
    @auth_code = AuthorizationCode.create! app: app, user: user
  end

  def test_generate_code
    refute_nil @auth_code.code
  end

  def test_set_expiration_time
    refute_nil @auth_code.expires_at
    assert_equal (Time.now + 1.hour).to_s, @auth_code.expires_at.to_s,
      'Auth code should expire in an hour'
    refute @auth_code.expired?
  end

  def test_time_to_expiration
    # Within 1 second
    assert_in_delta 1, 60.minutes.to_i, @auth_code.expires_in,
      'Should expire in 60 mins'
  end

  def test_expired?
    @auth_code.expires_at = Time.now - 1.hour
    assert @auth_code.expired?
  end
end
