class User < ActiveRecord::Base
  include Permissions
  acts_as_authentic
  
  belongs_to :school
  has_many :uploads
  has_many :jobs
  
  validates_presence_of :first_name, :last_name, :email
  default_scope :order => :last_name
  
  after_create :subscribe_to_newsletter!
  before_destroy :unsubscribe_from_newsletter!
  
  def user
  	self
  end
  
  def full_name
    [first_name, last_name].join(" ")
  end
  
  def deliver_password_reset_instructions
    reset_perishable_token!
    UserMailer.deliver_password_reset_instructions(self)
  end
  
  def subscribe_to_newsletter!
    HOMINID.subscribe(newsletter_list_id, email, { :FNAME => first_name, :LNAME => last_name }, { :email_type => 'html' })
  end
  
  def unsubscribe_from_newsletter!
    HOMINID.unsubscribe(newsletter_list_id, email)
  end
  
  def subscribed_to_newsletter?
    HOMINID.member_info(newsletter_list_id, email)
  rescue Hominid::ListError
    false
  end
  
  
  private
  
  def newsletter_list_id
    "de1f0cd8b5"
  end
end
