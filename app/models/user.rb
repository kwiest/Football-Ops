class User < ActiveRecord::Base
  include Permissions
  
  belongs_to :school
  has_one :conference, :through => :school
  has_one :district,   :through => :school
  has_one :division,   :through => :school
  acts_as_authentic
  
  has_attached_file :photo, 
  	:styles => { :medium => "128x128#", :small => "50x50#" },
  	:storage => :s3,
  	:s3_credentials => "#{{RAILS_ROOT"}/config/amazon_config.yml",
  	:path => "/:attachment/:id/:style/:filename"
  validates_attachment_size :photo, :less_than => 2.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  validates_presence_of :first_name, :last_name
  default_scope :order => :last_name
  
  def user
  	self
  end
  
  def full_name
    [first_name, last_name].join(" ")
  end
  
  def viewable_by?(user)
  	signed_in?
  end
  
  def createable_by?(user)
  	user.role == admin
  end
  
  def updateable_by?(user)
  	(creator == user) || (user.role == "admin")
  end
  
  def destroyable_by?(user)
  	(creator == user) || (user.role == "admin")
  end
  
end
