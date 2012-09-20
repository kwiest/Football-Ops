class AddApiKeysToApps < ActiveRecord::Migration
  def change
    add_column :apps, :api_key, :string
    add_column :apps, :api_key_secret, :string
  end
end
