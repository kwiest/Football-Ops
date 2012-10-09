require 'test_helper'

class CancanTest < ActiveSupport::TestCase
  def setup
    @user = users :kyle
  end

  def test_anyone_can_create_a_user
    ability = Ability.new nil
    assert ability.can?(:create, User)
    assert ability.cannot?(:manage, User)
  end

  def test_users_can_only_edit_their_own_profile
    other_user = users :hawk
    ability = Ability.new @user

    assert ability.can?(:edit, @user), 'User can edit their own profile'
    assert ability.can?(:update, @user), 'User can update their own profile'
    assert ability.cannot?(:edit, other_user), 'User cannot edit another profile'
    assert ability.cannot?(:update, other_user), 'User cannot update another profile'
  end

  def test_admins_can_manage_all
    @user.stubs(:admin?).returns true
    ability = Ability.new @user
    assert ability.can?(:manage, :all)
  end

  def test_conference_reps_can_manage_users_only
    @user.stubs(:conference_rep?).returns true
    ability = Ability.new @user
    assert ability.can?(:manage, User)
    assert ability.cannot?(:manage, :all)
  end

  def test_national_committee_members_can_manage_users_only
    @user.stubs(:national_committee?).returns true
    ability = Ability.new @user
    assert ability.can?(:manage, User)
    assert ability.cannot?(:manage, :all)
  end
end
