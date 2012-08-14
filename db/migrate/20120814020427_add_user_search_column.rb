class AddUserSearchColumn < ActiveRecord::Migration
  def up
    add_column :users, :search, 'tsvector'

    execute <<-SQL
      CREATE INDEX users_search_index
      ON users USING gin(search);

      CREATE TRIGGER users_search_update
      BEFORE INSERT OR UPDATE ON users
      FOR EACH ROW EXECUTE PROCEDURE
        tsvector_update_trigger( search,
                                 'pg_catalog.english',
                                 first_name,
                                 last_name );
    SQL
  end

  def down
    remove_column :users, :search
  end
end
