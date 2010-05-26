class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.integer :user_id
      t.string  :title
      t.string  :category
      t.text    :description
      t.text    :apply
      
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
