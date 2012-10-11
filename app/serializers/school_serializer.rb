class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :conference_id, :district_id, :division_id
end
