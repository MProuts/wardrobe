require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:///db/application.db"

class Shoe < ActiveRecord::Base
end

get "/" do
  @shoes = Shoe.order('random()')
  erb :"shoes/index"
end
