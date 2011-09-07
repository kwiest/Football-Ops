rails_env = ENV['RAILS_ENV']
worker_processes 3
preload_app true

timeout 30

# Use advanced garbage collecting if available
GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

before_fork do |server, worker|
  # Disconnect from the database before forking
  defined?(ActiveRecord::Base) && ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  # Re-connect to database after forking
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end
