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
  
  def deliver_password_reset_instructions
    reset_perishable_token!
    UserMailer.deliver_mimi_password_reset_instructions(self)
  end
end
