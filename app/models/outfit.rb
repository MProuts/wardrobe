class Outfit < ActiveRecord::Base
  belongs_to :user
  has_many :outfit_articles
  has_many :articles, :through => :outfit_articles

  def self.random
    self.create.tap do |outfit|
      outfit.date_worn = Date.today
      outfit.outfit_articles.create(:article => Article.random_top)
      outfit.outfit_articles.create(:article => Article.random_bottom)
      outfit.save
    end
  end

  def article_ids=(article_ids)
    self.outfit_articles.destroy_all
    article_ids.each do |article_id|
      self.outfit_articles.build(:article_id => article_id)
    end
  end

end
