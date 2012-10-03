class AccessTokenSerializer < ActiveModel::Serializer
  has_one :user
  attributes :access_token, :token_type, :created_at

  def access_token
    object.token
  end

  def token_type
    'bearer'
  end
end
