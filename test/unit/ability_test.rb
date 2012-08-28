require 'test_helper'

class AbilityTest < Test::Unit::TestCase
  def test_nil_user
    ability = Ability.new nil
    assert ability.can?(:create, User)
    refute ability.can?(:read, :all)
    refute ability.can?(:manage, :all)
  end

  def test_any_user_can_read
    user = User.new
    ability = Ability.new user
    assert ability.can?(:read, :all)
    refute ability.can?(:manage, User)
    refute ability.can?(:manage, School)
    refute ability.can?(:manage, Conference)
    refute ability.can?(:manage, District)
    refute ability.can?(:manage, Division)
  end

  def test_admin_users
    user = User.new(admin: true)
    ability = Ability.new user
    assert ability.can?(:manage, :all)
  end

  def test_conference_reps
    user = User.new(conference_rep: true)
    ability = Ability.new user
    assert ability.can?(:manage, User)
    refute ability.can?(:manage, School)
    refute ability.can?(:manage, Conference)
    refute ability.can?(:manage, District)
    refute ability.can?(:manage, Division)
  end

  def test_national_committee
    user = User.new(national_committee: true)
    ability = Ability.new user
    assert ability.can?(:manage, User)
    refute ability.can?(:manage, School)
    refute ability.can?(:manage, Conference)
    refute ability.can?(:manage, District)
    refute ability.can?(:manage, Division)
  end
end
