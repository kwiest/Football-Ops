class App < ActiveRecord::Base
  attr_accessible :name, :description, :website, :redirect_uri

  belongs_to :user
  has_many   :authorization_codes, dependent: :destroy
  has_many   :access_tokens,       dependent: :destroy

  validates :name, :description, :website, :redirect_uri, presence: true

  before_create :generate_client_id, :generate_client_secret


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

  def generate_client_id
    begin
      self.client_id = SecureRandom.hex
    end while self.class.exists? client_id: client_id
  end

  def generate_client_secret
    begin
      self.client_secret = SecureRandom.hex
    end while self.class.exists? client_secret: client_secret
  end
end
