class AuthorizationCode < ActiveRecord::Base
  EXPIRY_TIME = 1.hour

  belongs_to :app
  belongs_to :user

  before_create :generate_code, :set_expiration_time

  def expires_in
    (Time.at(expires_at.to_i) - Time.now).to_i
  end

  def expired?
    expires_in <= 0
  end


  private

  def generate_code
    begin
      self.code = SecureRandom.hex 32
    end while self.class.exists? code: code
  end

  def set_expiration_time
    expiration_time = Time.now + EXPIRY_TIME
    self.expires_at = expiration_time
  end
end
