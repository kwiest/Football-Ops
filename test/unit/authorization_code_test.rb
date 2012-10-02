require 'test_helper'

class AuthorizationCodeTest < ActiveSupport::TestCase
  def setup
    @auth_code = AuthorizationCode.create!
  end

  # Test associations
  should belong_to :app

  def test_generate_code
    refute_nil @auth_code.code
  end

  def test_set_expiration_time
    refute_nil @auth_code.expires_at
    assert_equal (Time.now + 1.hour).to_s, @auth_code.expires_at.to_s,
      'Auth code should expire in an hour'
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
