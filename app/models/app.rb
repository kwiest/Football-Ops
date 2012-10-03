class App < ActiveRecord::Base
  attr_accessible :name, :description, :website, :redirect_uri

  belongs_to :user
  has_many   :authorization_codes, dependent: :destroy
  has_many   :access_tokens,       dependent: :destroy

  validates :name, :description, :website, :redirect_uri, presence: true

  before_create :generate_api_key, :generate_api_secret_key


  # Authorization code to be used to generate an AccessToken
  def create_authorization_code_for_user(user)
    new_code = authorization_codes.create! user_id: user.id
    new_code
  end

  # Access token to be used to make authenticated requests
  def create_access_token_from_authorization_code(authorization_code)
    AccessToken.create_from_authorization_code authorization_code
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
