class AddSchoolToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :school, :string
  end

  def self.down
    remove_column :jobs, :school
  end
end
