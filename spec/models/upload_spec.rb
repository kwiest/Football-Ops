require "spec_helper"

describe Upload do
  it "should belong to a user" do
    should belong_to :user
  end
  
  it "should belong to uploadable (polymorphic)" do
    should belong_to :uploadable
  end
  
  it "should validate" do
    should validate_presence_of :name
  end
  
  it "should validate attachment" do
    should have_attached_file :asset
    should validate_attachment_presence :asset
    should validate_attachment_content_type(:asset).allowing('image/jpeg', 'image/png', 'application/pdf')
    should validate_attachment_size(:asset).less_than(5.megabytes)
  end
end