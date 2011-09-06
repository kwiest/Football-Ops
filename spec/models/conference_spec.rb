require "spec_helper"

describe Conference do
  before(:each) do
    @conference = Factory :conference
  end
  
  it "should validate" do
    should validate_presence_of :name
  end
  
  it "should have many schools" do
    should have_many :schools
  end
  
  it "should have many users" do
    should have_many :users
  end
  
  it "should have many uploads" do
    should have_many :uploads
  end
  
  it "should provide the name in the parameter" do
    id = @conference.id
    name = @conference.name
    param = "#{id}-#{name.parameterize}"
    @conference.to_param.should eql(param)
  end
end