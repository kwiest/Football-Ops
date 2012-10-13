class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_street, :address_city_state_zip, :conference_id, :district_id, :division_id

  def address_street
    school.address1
  end

  def address_city_state_zip
    "#{school.city}, #{school.state} #{school.zip}"
  end
end
