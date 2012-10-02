require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @kyle = users :kyle
  end

  # Test validations
  should validate_presence_of :first_name
  should validate_presence_of :last_name
  should validate_presence_of :email
  should validate_presence_of :school

  # Test associations
  should belong_to :school
  should have_one  :conference
  should have_one  :district
  should have_one  :division
  should have_many :apps
  should have_many :authorization_codes
  should have_many :access_tokens

  def test_full_name
    assert_equal 'Kyle Wiest', @kyle.full_name
  end

  def test_name_delegations
    assert_equal 'University of Oregon', @kyle.school_name
    assert_equal 'Pac-12 Conference', @kyle.conference_name
    assert_equal 'District 9', @kyle.district_name
    assert_equal 'FBS', @kyle.division_name
  end

  def test_deletes_apps_when_deleted
    apps = [stub]
    @kyle.stubs(:apps).returns apps
    apps.expects :delete_all
    @kyle.destroy
  end
end
