require "spec_helper"

describe District do
  before(:each) do
    @district = Factory :district
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
    id = @district.id
    name = @district.name
    param = "#{id}-#{name.parameterize}"
    @district.to_param.should eql(param)
  end
end