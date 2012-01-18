require 'spec_helper'
require 'cancan/matchers'

describe AbilityController do
  let(:guest)         { Struct.new(admin?: false, conference_rep?: false, national_committee?: false) }
  let(:user)          { stub(:user) }
  let(:admin)         { stub(:user, admin: true) }
  let(:conf_rep)      { stub(:user, conference_rep: true) }
  let(:nat_committee) { stub(:user, national_committee: true) }

  describe "a guest who is not signed-in" do
    let(:ability) { Ability.new(guest) }

    it "should be able to create a new user" do
      ability.should be_able_to(:create, User)
    end
  end
end
