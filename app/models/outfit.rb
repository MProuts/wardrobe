class Outfit < ActiveRecord::Base
  belongs_to :user
  has_many :outfit_articles
  has_many :articles, :through => :outfit_articles

  def article_ids=(article_ids)
    self.outfit_articles.destroy_all
    article_ids.each do |article_id|
      self.outfit_articles.build(:article_id => article_id)
    end
  end
end
