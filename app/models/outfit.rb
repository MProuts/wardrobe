class Outfit < ActiveRecord::Base
  belongs_to :user
  has_many :outfit_articles
  has_many :articles, :through => :outfit_articles
end
