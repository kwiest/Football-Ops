class CreateAuthorizationCodes < ActiveRecord::Migration
  def up
    create_table :authorization_codes do |t|
      t.integer  :app_id
      t.string   :code
      t.datetime :expires_at

      t.timestamps
    end
  end

  def down
    drop_table :authorization_codes
  end
end
