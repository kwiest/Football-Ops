class School < ActiveRecord::Base
  has_many :users
  
  belongs_to :conference
  belongs_to :district
  belongs_to :division
  
  validates :name, presence: true, uniqueness: true
  validates :conference, :district, :division, presence: true

  default_scope order(:name)

  def self.search(query)
    sql = sanitize_sql_array ["plainto_tsquery('english', ?)", query]
    where("search @@ #{sql}").order("ts_rank_cd(search, #{sql}) DESC")
  end
end
