class App < ActiveRecord::Base
  belongs_to :user
  validates :name, :description, :website, :redirect_uri, presence: true
end
