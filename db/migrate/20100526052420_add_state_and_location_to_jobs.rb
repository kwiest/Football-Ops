class AddStateAndLocationToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :location, :string
  end

  def self.down
    remove_column :jobs, :location
  end
end
