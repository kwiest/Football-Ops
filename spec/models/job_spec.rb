require "spec_helper"

describe Job do
  before(:each) do
    @job = Factory :job
  end
  
  it "should validate" do
    should validate_presence_of :title
    should validate_presence_of :category
    should validate_presence_of :school
    should validate_presence_of :location
    should validate_presence_of :description
    should validate_presence_of :apply
  end
  
  it "should belong to a user" do
    should belong_to :user
  end
  
  it "should provide a #css_class" do
    category = @job.category.dasherize
    @job.css_class.should eql(category)
  end
  
  it "should provide a #pretty_category" do
    category = @job.category.humanize
    @job.pretty_category.should eql(category)
  end
  
  it "should provide a formatted #pretty_date" do
    date = @job.created_at.strftime("%B %d, %Y")
    @job.pretty_date.should eql(date)
  end
  
  it "should include formatting methods in #to_json" do
    json = @job.as_json({})
    json.has_key?(:css_class).should be_true
    json.has_key?(:pretty_category).should be_true
    json.has_key?(:pretty_date).should be_true
  end
end