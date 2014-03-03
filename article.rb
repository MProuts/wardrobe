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
  @tops = Article.where("article_type = 'top'").order('random()')
  @bottoms = Article.where("article_type = 'bottom'").order('random()')

  erb :"articles/index"
end

get "/articles/tops/new" do
  @type = "top"

  erb :"articles/new"
end

get "/articles/bottoms/new" do
  @type = "bottom"

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

post "/articles/:id/edit" do
  Article.find_by_id(params["id"]).update_attributes(params["article"])

  redirect to("/articles/#{params["id"]}")
end

delete "/articles/:id" do
  Article.destroy(params["id"])

  redirect to("/articles")
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

