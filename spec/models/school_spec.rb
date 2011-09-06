require "spec_helper"

describe School do
  before(:each) do
    @school = Factory :school
  end
  
  it "should validate" do
    should validate_presence_of :name
    should validate_uniqueness_of :name
    should validate_presence_of :conference
    should validate_presence_of :district
    should validate_presence_of :division
  end
  
  it "should have many users" do
    should have_many :users
  end
  
  it "should have many uploads" do
    should have_many :uploads
  end
  
  it "should belong to a conference" do
    should belong_to :conference
  end
  
  it "should belong to a district" do
    should belong_to :district
  end
  
  it "should belong to a division" do
    should belong_to :division
  end
  
  it "should provide the name in the parameter" do
    id = @school.id
    name = @school.name
    param = "#{id}-#{name.parameterize}"
    @school.to_param.should eql(param)
  end
end