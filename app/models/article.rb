class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :article_type
  has_many :outfit_articles
  has_many :articles, :through => :outfit_articles

  validates_presence_of :subtype, :brand, :color, :image_url
end

# Routes/Controller
