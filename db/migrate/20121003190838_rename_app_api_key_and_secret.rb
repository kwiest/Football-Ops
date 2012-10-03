class RenameAppApiKeyAndSecret < ActiveRecord::Migration
  def change
    rename_column :apps, :api_key, :client_id
    rename_column :apps, :api_key_secret, :client_secret
  end
end
