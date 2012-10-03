class ChangeExpiresAtToDatetime < ActiveRecord::Migration
  def change
    remove_column :authorization_codes, :expires_at
    add_column :authorization_codes, :expires_at, :datetime
  end
end
