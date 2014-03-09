class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :article_type
  has_many :outfit_articles
  has_many :outfits, :through => :outfit_articles

  validates_presence_of :subtype, :brand, :color, :image_url
  def image_tag
    <<-HTML
  <img src="#{self.image_url}" width=100px height=100px alt="article_#{self.id}"</img>
  HTML
  end
end

# Routes/Controller
