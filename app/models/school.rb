class School < ActiveRecord::Base
  has_many   :users
  has_many :uploads, as: :uploadable
  
  belongs_to :conference
  belongs_to :district
  belongs_to :division
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :conference
  validates_presence_of :district
  validates_presence_of :division
  
  default_scope order: :name
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
end
