class AddSchoolSearchColumn < ActiveRecord::Migration
  def up
    add_column :schools, :search, 'tsvector'

    execute <<-SQL
      CREATE INDEX schools_search_index
      ON schools USING gin(search);

      CREATE TRIGGER schools_search_update
      BEFORE INSERT OR UPDATE ON schools
      FOR EACH ROW EXECUTE PROCEDURE
        tsvector_update_trigger( search,
                                 'pg_catalog.english',
                                 name );
    SQL
  end

  def down
    remove_column :schools, :search
  end
end
