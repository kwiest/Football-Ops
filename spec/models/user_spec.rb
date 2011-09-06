require 'spec_helper'

describe User do
  before :all do
    User.any_instance.stubs(:subscribe_to_newsletter!).returns(true)
    User.any_instance.stubs(:unsubscribe_to_newsletter!).returns(true)
    
    @user = Factory :user
    @user.should be_valid
  end
  
  it "should validate" do
    should validate_presence_of :first_name
    should validate_presence_of :last_name
    should validate_presence_of :email
    should validate_presence_of :school
  end
  
  it "should belong to a school" do
    should belong_to :school
  end
  
  it "should belong to a conference" do
    should have_one :conference
  end
  
  it "should belong to a district" do
    should have_one :district
  end
  
  it "should belong to a division" do
    should have_one :division
  end
  
  it "should have many uploads" do
    should have_many :uploads
  end
  
  it "should have many jobs" do
    should have_many :jobs
  end
  
  it "should provide a #full_name" do
    full_name = [@user.first_name, @user.last_name].join " "
    @user.full_name.should eql(full_name)
  end
  
  it "should provide a #conference_name" do
    conference_name = @user.conference.name
    @user.conference_name.should eql(conference_name)
  end
  
  it "should provide a #district_name" do
    district_name = @user.district.name
    @user.district_name.should eql(district_name)
  end
  
  it "should provide a #division_name" do
    division_name = @user.division.name
    @user.division_name.should eql(division_name)
  end
  
  it "should provide a #school_name" do
    school_name = @user.school.name
    @user.school_name.should eql(school_name)
  end
  
  it "should check newsletter subscription status" do
    @user.subscribed_to_newsletter?.should be_false
  end
  
  it "should create a newsletter subscription on creation" do
    user = User.new
    user.first_name = "Kyle"
    user.last_name = "Wiest"
    user.email = "me@example.com"
    user.password = "secret"
    user.password_confirmation = "secret"
    user.school = Factory :school
    user.expects(:subscribe_to_newsletter!).returns(true)
    user.save
  end
  
  it "should check subscription status on an email change" do
    @user.expects(:check_subscription_status)
    @user.email = "somethingnew@example.com"
    @user.save
  end
  
  it "should unsubscribe before deletion" do
    @user.expects(:unsubscribe_from_newsletter!).returns(true)
    @user.destroy
  end
end