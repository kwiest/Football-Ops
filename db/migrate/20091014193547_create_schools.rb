class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.integer :conference_id
      t.integer :district_id
      t.integer :division_id
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :secretary_phone
      t.string :secretary_fax
      t.string :coach_name

      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
