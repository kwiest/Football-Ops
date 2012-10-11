class PaginatedSchoolSerializer < SchoolSerializer
  has_many :users
end
