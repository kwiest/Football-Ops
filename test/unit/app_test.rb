require 'test_helper'

class AppTest < ActiveSupport::TestCase
  # Test validations
  should validate_presence_of(:name)
  should validate_presence_of(:description)
  should validate_presence_of(:website)
  should validate_presence_of(:redirect_uri)

  # Test associations
  should belong_to(:user)
end
