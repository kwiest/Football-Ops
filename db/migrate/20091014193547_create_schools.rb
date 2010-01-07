class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.integer :conference_id
      t.integer :district_id
      t.integer :division_id
      t.string :name
      t.string :address1
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
