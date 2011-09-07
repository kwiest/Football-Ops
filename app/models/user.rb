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
  
  after_create :subscribe_to_newsletter!
  before_update :check_subscription_status
  before_destroy :unsubscribe_from_newsletter!
  
  def full_name
    [first_name, last_name].join(" ")
  end
  alias_method :name, :full_name
  
  def deliver_password_reset_instructions
    reset_perishable_token!
    UserMailer.deliver_password_reset_instructions(self)
  end
  
  def subscribe_to_newsletter!
    HOMINID.subscribe(newsletter_list_id, email, { :FNAME => first_name, :LNAME => last_name }, { :email_type => 'html' })
  end
  
  def unsubscribe_from_newsletter!
    HOMINID.unsubscribe(newsletter_list_id, email) if subscribed_to_newsletter?
  end
  
  def subscribed_to_newsletter?
    info = HOMINID.member_info(newsletter_list_id, email)
    info["status"] == "subscribed"
  rescue Hominid::ListError
    false
  end
  
  
  private
  
  def newsletter_list_id
    "de1f0cd8b5"
  end
  
  def check_subscription_status
    if email_changed?
      subscribe_to_newsletter! unless subscribed_to_newsletter?
    else
      true
    end
  end
end
