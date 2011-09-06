require "spec_helper"

describe Division do
  before(:each) do
    @division = Factory :division
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
    id = @division.id
    name = @division.name
    param = "#{id}-#{name.parameterize}"
    @division.to_param.should eql(param)
  end
end