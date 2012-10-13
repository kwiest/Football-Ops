class PaginatedSchoolSerializer < SchoolSerializer
  has_many :users, embed: :ids, key: :user_ids
end
