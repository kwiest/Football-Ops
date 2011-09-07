class Upload < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true
  belongs_to :user
  
  validates_presence_of :name
  
  has_attached_file :asset,
    storage: :s3,
    s3_credentials: {
      access_key_id: ENV['S3_KEY'],
      secret_access_key: ENV['S3_SECRET']
    },
    bucket: ENV['S3_BUCKET'],
    path: ":attachment/:id/:filename"
  validates_attachment_presence :asset, message: "Can't be blank"
  validates_attachment_content_type :asset,
    content_type: ["image/jpeg", "image/png", "application/pdf"],
    message: "Files can only be images (jpg, jpeg, png), or PDFs"
  validates_attachment_size :asset, less_than: 5.megabytes, message: "Your file must be under 5Mb"
end
