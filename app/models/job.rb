class Job < ActiveRecord::Base
  
  belongs_to :user
  
  validates_presence_of :title
  validates_presence_of :category
  validates_presence_of :school
  validates_presence_of :location
  validates_presence_of :description
  validates_presence_of :apply
  
  default_scope order: 'created_at DESC'
  scope :full_time, where(category: 'full_time')
  scope :part_time, where(category: "part_time")
  scope :paid_internships, where(category: "paid_internship")
  scope :unpaid_internships, where(category: "unpaid_internship")
  
  def css_class
    category.dasherize
  end
  
  def pretty_category
    category.humanize
  end
  
  def pretty_date
    created_at.strftime("%B %d, %Y")
  end
  
  def as_json(options)
    options ||= {}
    super(options.merge({
      methods: [:css_class, :pretty_category, :pretty_date]
    }))
  end
end