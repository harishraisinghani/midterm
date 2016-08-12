require 'active_record'
require 'pry'
require 'active_support/all'
require './lib/userimporter'
require './lib/skillimporter'
require './lib/feedbackimporter'
require './lib/userskillsimporter'
require './app/models/favourite'
require './app/models/feedback'
require './app/models/skill'
require './app/models/user'
require './app/models/userskill'

# Add new app/ and lib/ files here when they are created.

module AppConfig

  DATABASE = ENV['DATABASE'] || 'development'

  DATABASE_PATH = File.absolute_path("db/#{DATABASE}.sqlite3", File.dirname(__FILE__))

  def self.establish_connection
    puts "Connecting to database '#{DATABASE_PATH}'"
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: DATABASE_PATH
    )
  end

end