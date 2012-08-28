require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  # Test validations
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  should validate_presence_of(:conference)
  should validate_presence_of(:district)
  should validate_presence_of(:division)

  # Test associations
  should have_many(:users)
  should belong_to(:conference)
  should belong_to(:district)
  should belong_to(:division)
end
