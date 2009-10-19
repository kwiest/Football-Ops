class Conference < ActiveRecord::Base
  has_many :schools
  
  validates_presence_of :name
  default_scope :order => :name
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
end
