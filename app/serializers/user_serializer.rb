class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :school_id, :created_at, :updated_at,
    :conference_id, :district_id, :division_id, :school, :url

  def conference_id
    user.conference.id
  end

  def district_id
    user.district.id
  end

  def division_id
    user.division.id
  end

  def url
    "http://footballops.org/api/users/#{user.id}"
  end
end
