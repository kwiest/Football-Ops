class Job < ActiveRecord::Base
  include Permissions
  
  belongs_to :user
  
  validates_presence_of :title, :category, :school, :location, :description, :apply, :state
  
  default_scope :order => 'created_at DESC'
  named_scope :full_time, :conditions => {:category => "full_time"}
  named_scope :part_time, :conditions => {:category => "part_time"}
  named_scope :paid_internships, :conditions => {:category => "paid_internship"}
  named_scope :unpaid_internships, :conditions => {:category => "unpaid_internship"}
end