class Conference < ActiveRecord::Base
  has_many :schools
  has_many :users, :through => :schools
  has_many :uploads, :as => :uploadable
  
  validates_presence_of :name
  default_scope :order => :name
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
end
