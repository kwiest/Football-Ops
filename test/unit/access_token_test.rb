require 'test_helper'

class AccessTokenTest < ActiveSupport::TestCase
  # Test validations
  should validate_presence_of :app
  should validate_presence_of :user

  # Test associations
  should belong_to :app
  should belong_to :user

  def test_generate_token_on_create
    app = apps :ios
    user = users :kyle
    access_token = AccessToken.create! app: app, user: user

    refute_nil access_token.token
  end
end
