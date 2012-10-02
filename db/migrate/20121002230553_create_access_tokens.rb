class CreateAccessTokens < ActiveRecord::Migration
  def up
    create_table :access_tokens do |t|
      t.integer :app_id
      t.integer :user_id
      t.string  :token

      t.timestamps
    end
  end

  def down
    drop_table :access_tokens
  end
end
