class User < ActiveRecord::Base
  include Permissions
  acts_as_authentic
  
  belongs_to :school
  belongs_to :conference
  belongs_to :district
  belongs_to :division
  
  validates_presence_of :first_name, :last_name, :email
  default_scope :order => :last_name
  
  def user
  	self
  end
end
