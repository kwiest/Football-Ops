class AuthorizationCodeExpiredError < RuntimeError; end

class AccessToken < ActiveRecord::Base
  belongs_to :app
  belongs_to :user

  before_create :generate_token

  validates :app, :user, presence: true

  def self.create_from_authorization_code(authorization_code)
    raise AuthorizationCodeExpiredError if authorization_code.expired?
    app, user  = authorization_code.app, authorization_code.user

    destroy_old_tokens app, user
    create! app: app, user: user
  end


  private

  def generate_token
    begin
      self.token = SecureRandom.hex 32
    end while self.class.exists? token: token
  end

  def self.destroy_old_tokens(app, user)
    where(app_id: app, user_id: user).map(&:destroy) 
  end
end
