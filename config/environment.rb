#Set SINATRA_ENV to development if not already set
ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/wardrobe_#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
