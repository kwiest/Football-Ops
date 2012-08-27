class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone, :fax,
    :created_at, :updated_at, :url,
    :conference_rep, :national_committee, :admin,
    :conference_id, :conference_name,
    :district_id, :district_name,
    :division_id, :division_name,
    :school_id, :school_name

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
