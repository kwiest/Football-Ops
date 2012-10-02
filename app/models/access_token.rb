class AccessToken < ActiveRecord::Base
  belongs_to :app
  belongs_to :user

  before_create :generate_token

  validates :app, :user, presence: true

  private

  def generate_token
    begin
      self.token = SecureRandom.hex 32
    end while self.class.exists? token: token
  end
end
