require 'rspec/core/rake_task'
$LOAD_PATH << "lib"

RSpec::Core::RakeTask.new(:spec)

task :default => [ :test_prepare, :spec ]

desc 'create the production database setup'
task :bootstrap_database do
  require 'environment'
  Environment.environment = "production"
  database = Environment.database_connection
  database.create_tables
end

desc 'prepare the test database'
task :test_prepare do
  require 'environment'
  test_database = "db/cal_meal.sqlite3"
  File.delete(test_database) if File.exist?(test_database)
  Environment.environment = "test"
  database = Environment.database_connection
  database.create_tables
end
