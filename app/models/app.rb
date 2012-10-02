class App < ActiveRecord::Base
  attr_accessible :name, :description, :website, :redirect_uri

  belongs_to :user
  has_many   :authorization_codes

  validates :name, :description, :website, :redirect_uri, presence: true

  before_create :generate_api_key, :generate_api_secret_key

  def create_authorization_code!
    new_code = authorization_codes.create!
    new_code.code
  end

  private

  def generate_api_key
    begin
      self.api_key = SecureRandom.hex
    end while self.class.exists? api_key: api_key
  end

  def generate_api_secret_key
    begin
      self.api_key_secret = SecureRandom.hex
    end while self.class.exists? api_key_secret: api_key_secret
  end
end
