class Article < ActiveRecord::Base
  validates_presence_of :subtype, :brand, :color, :image_url
end

# Routes/Controller
