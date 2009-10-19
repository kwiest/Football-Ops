class User < ActiveRecord::Base
  include Permissions
  
  belongs_to :school
  acts_as_authentic
  
  has_attached_file :photo, :styles => { :small => "50x50" }
  validates_attachment_size :photo, :less_than => 2.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  validates_presence_of :first_name, :last_name, :email
  default_scope :order => :last_name, :conditions => { :active => true, :confirmed => true }
  
  def full_name
    [first_name, last_name].join(" ")
  end
  
  def user
    self
  end
end
