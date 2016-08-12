require './app_config'
require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require ::File.expand_path('../config/environment', __FILE__)
  end

  desc 'Retrieves the current schema version number'
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end

  desc 'populate the test database with data'
  task :populate do
  AppConfig.establish_connection
  #UserImporter.new.import
  #SkillImporter.new.import
  #FeedbackImporter.new.import
  UserSkillsImporter.new.import

  end

end


