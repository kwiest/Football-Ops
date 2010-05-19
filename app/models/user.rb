class User < ActiveRecord::Base
  include Permissions
  acts_as_authentic
  
  belongs_to :school
  
  validates_presence_of :first_name, :last_name, :email
  default_scope :order => :last_name
  
  def user
  	self
  end
  
  def full_name
    [first_name, last_name].join(" ")
  end
end
