class School < ActiveRecord::Base
  has_many   :users
  belongs_to :conference
  belongs_to :division
  belongs_to :district
  
  validates_presence_of :name
  default_scope :order => :name
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
end
