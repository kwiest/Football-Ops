require 'test_helper'

class AccessTokenTest < ActiveSupport::TestCase
  # Test associations
  should belong_to :app
  should belong_to :user
end
