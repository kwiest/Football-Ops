class DivisionSerializer < ActiveModel::Serializer
  has_many :users
  attributes :id, :name
end

