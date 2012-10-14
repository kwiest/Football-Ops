class DistrictSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :users, embed: :ids, key: :user_ids
end

