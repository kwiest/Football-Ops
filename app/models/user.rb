class User < ActiveRecord::Base
  acts_as_authentic
  
  belongs_to :school
  has_one :division, through: :school
  has_one :conference, through: :school
  has_one :district, through: :school

  delegate :name, to: :conference, prefix: true
  delegate :name, to: :district, prefix: true
  delegate :name, to: :division, prefix: true
  delegate :name, to: :school, prefix: true
  
  has_many :uploads
  has_many :jobs
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :school
  
  default_scope order: :last_name, include: [:school, :division, :conference, :district]

  # Search method
  def self.search(query)
    sql = sanitize_sql_array ["plainto_tsquery('english', ?)", query]
    where("search @@ #{sql}").order("ts_rank_cd(search, #{sql}) DESC")
  end
  
  def full_name
    [first_name, last_name].join(" ")
  end
  alias_method :name, :full_name
end
