require 'pry'
require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:///db/application.db"
# Model
# =====
#
class Shoe < ActiveRecord::Base
  validates_presence_of :subtype, :brand, :color, :image_url
end

# Routes/Controller
# =================
# 
get "/shoes" do
  @shoes = Shoe.order('random()')

  erb :"shoes/index"
end

get "/shoes/new" do
  erb :"shoes/new"
end

post "/shoes/new" do
  Shoe.create(params["shoe"])

  redirect to("/shoes")
end

# Helpers
# =======

module ApplicationHelpers
  def title
    @title ? "Wardrobe -- #{@title}" : "Wardrobe"
  end

  def season 
    current_month = Time.now.month
    winter = [1, 2, 3]
    spring = [4, 5, 6]
    summer = [7, 8, 9]
    fall = [10, 11, 12]
    case true
    when winter.include?(current_month)
      "Winter"
    when spring.include?(current_month)
      "Spring"
    when summer.include?(current_month)
      "Summer"
    when fall.include?(current_month)
      "Fall"
    end
  end

end

helpers ApplicationHelpers

# helpers do 
# is a shortcut for helpers = Module.new { }
# ...
# this creates an anonymous module
# impossible to reference for testing
