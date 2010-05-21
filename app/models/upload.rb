class Upload < ActiveRecord::Base
  belongs_to :uploadable, :polymorphic => true
  has_attached_file :asset,
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml"

  validates_presence_of :name
  validates_attachment_presence :asset
  # validates_attachment_size :asset, :less_than => 5.megabytes
  validates_attachment_content_type :asset,
    :content_type => ["image/jpeg", "image/png", "application/pdf"],
    :message => "Files can only be images (jpg, jpeg, png), or PDFs"
end
