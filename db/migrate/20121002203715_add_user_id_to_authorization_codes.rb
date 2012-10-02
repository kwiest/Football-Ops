class AddUserIdToAuthorizationCodes < ActiveRecord::Migration
  def change
    add_column :authorization_codes, :user_id, :integer
  end
end
