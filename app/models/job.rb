class Job < ActiveRecord::Base
  include Permissions
  
  belongs_to :user
  
  validates_presence_of :title, :category, :school, :location, :description, :apply
  
  default_scope :order => 'created_at DESC'
  scope :full_time, where(:category => 'full_time')
  scope :part_time, where(:category => "part_time")
  scope :paid_internships, where(:category => "paid_internship")
  scope :unpaid_internships, where(:category => "unpaid_internship")
end