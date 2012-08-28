require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @kyle = users :kyle
  end

  def test_validations
    assert validate_presence_of(:first_name)
    assert validate_presence_of(:last_name)
    assert validate_presence_of(:email)
    assert validate_presence_of(:school)
  end

  def test_associations
    assert belong_to :school
    assert have_one :conference
    assert have_one :district
    assert have_one :division
  end

  def test_full_name
    assert_equal 'Kyle Wiest', @kyle.full_name
  end

  def test_name_delegations
    assert_equal 'University of Oregon', @kyle.school_name
    assert_equal 'Pac-12 Conference', @kyle.conference_name
    assert_equal 'District 9', @kyle.district_name
    assert_equal 'FBS', @kyle.division_name
  end
end
