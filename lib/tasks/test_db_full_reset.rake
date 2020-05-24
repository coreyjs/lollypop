desc "Setup test database - drops, loads schema, migrates and seeds the test db"
task :test_db_setup do
  Rails.env = ENV['RAILS_ENV'] = 'test'
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  #ActiveRecord::Base.establish_connection
  Rake::Task['db:migrate'].invoke
end