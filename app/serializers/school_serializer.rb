class SchoolSerializer < ActiveModel::Serializer
  has_many :users
  attributes :id, :name, :conference_id, :district_id, :division_id
end
