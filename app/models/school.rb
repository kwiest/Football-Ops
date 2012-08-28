class School < ActiveRecord::Base
  has_many :users
  
  belongs_to :conference
  belongs_to :district
  belongs_to :division
  
  validates :name, presence: true, uniqueness: true
  validates :conference, :district, :division, presence: true

  default_scope order(:name)
end
