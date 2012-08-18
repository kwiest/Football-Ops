class School < ActiveRecord::Base
  has_many :users
  
  belongs_to :conference
  belongs_to :district
  belongs_to :division
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates :conference, :district, :division, presence: true

  default_scope order(:name)
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
end
