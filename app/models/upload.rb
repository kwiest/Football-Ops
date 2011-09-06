class Upload < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true
  belongs_to :user
  
  validates_presence_of :name
  
  has_attached_file :asset,
    storage: :s3,
    s3_credentials: "#{Rails.root}/config/amazon_s3.yml",
    path: ":attachment/:id/:filename"
  validates_attachment_presence :asset, message: "Can't be blank"
  validates_attachment_content_type :asset,
    content_type: ["image/jpeg", "image/png", "application/pdf"],
    message: "Files can only be images (jpg, jpeg, png), or PDFs"
  validates_attachment_size :asset, less_than: 5.megabytes, message: "Your file must be under 5Mb"
end
