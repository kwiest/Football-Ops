require 'test_helper'

class DivisionTest < Test::Unit::TestCase
  # Test validations
  should validate_presence_of(:name)

  # Test associations
  should have_many(:schools)
  should have_many(:users)
end
