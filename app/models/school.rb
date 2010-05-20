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
  
  def full_address
    "#{address1}, #{city}, #{state} #{zip}"
  end
  
  def geocoded_location
    gg = GoogleGeocode.new(YAML.load_file(RAILS_ROOT + '/config/gmaps_api_key.yml')[ENV['RAILS_ENV']])
    gg.locate(full_address)
  end
  
end
