require 'pry'
require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:///db/development.db"
# Model
# =====
#
class Article < ActiveRecord::Base
  validates_presence_of :subtype, :brand, :color, :image_url
end

# Routes/Controller
# =================
# 
get "/articles" do
  @articles = Article.order('random()')

  erb :"articles/index"
end

get "/articles/new" do
  erb :"articles/new"
end

post "/articles/new" do
  Article.create(params["article"])

  redirect to("/articles")
end

get "/articles/:id" do
  @article = Article.find_by_id(params["id"])

  erb :"articles/show"
end

get "/articles/:id/edit" do
  @article = Article.find_by_id(params["id"])

  erb :"articles/edit"
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

# helpers do 
# is a shortcut for helpers = Module.new { }
# ...
# this creates an anonymous module
# impossible to reference for testing
helpers ApplicationHelpers

