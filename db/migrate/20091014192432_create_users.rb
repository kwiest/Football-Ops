class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :school_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :perishable_token
      t.string :phone
      t.string :fax
      t.boolean :conference_rep
      t.boolean :national_committee
      t.boolean :admin

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
