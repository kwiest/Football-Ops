class CreateApps < ActiveRecord::Migration
  def up
    create_table :apps do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :website
      t.string :redirect_uri

      t.timestamps
    end
  end

  def down
    drop_table :apps
  end
end
