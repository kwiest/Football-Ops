class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_street, :address_city_state_zip,
    :conference_id, :conference_name,
    :district_id, :district_name,
    :division_id, :division_name
  has_many :users, embed: :ids

  def address_street
    school.address1
  end

  def address_city_state_zip
    "#{school.city}, #{school.state} #{school.zip}"
  end

  def conference_name
    school.conference.name
  end

  def district_name
    school.district.name
  end

  def division_name
    school.division.name
  end
end
