class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :article_type
  has_many :outfit_articles
  has_many :outfits, :through => :outfit_articles

  def self.random_top
    self.all.select { |article| article.article_type.name == "top" }.sample
  end

  def self.random_bottom
    self.all.select { |article| article.article_type.name == "bottom" }.sample
  end

  # validates_presence_of :subtype, :brand, :color, :image_url
  def image_tag
    <<-HTML
  <img src="#{self.image_url}" width=100px height=100px alt="article_#{self.id}"</img>
  HTML
  end

  def average_color
    img =  Magick::Image.read("public/#{self.image_url}").first
    pix = img.scale(1, 1)
    avg_color_hex = pix.to_color(pix.pixel_color(0,0))
    avg_color_hex
  end

  def color_tag
    <<-HTML
    <a href="/articles/#{self.id}">
      <div style="background-color:#{self.average_color};
                  height:100px;
                  width:100px;">
      </div>
    </a>
    HTML
  end

end

# Routes/Controller
