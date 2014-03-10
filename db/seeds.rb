require_relative '../config/environment.rb'
@top = ArticleType.create(:name => "top")
@bottom = ArticleType.create(:name => "bottom")

5.times do |i|
  Article.create(
    :subtype => "type_#{i + 1}", 
    :brand => "brand_#{i + 1}", 
    :color => "color_#{i + 1}", 
    :image_url => "/images/tops/top#{i + 1}.jpeg", 
    :article_type_id => @top.id
  )
end

5.times do |i|
  Article.create(
    :subtype => "type_#{i + 6}", 
    :brand => "brand_#{i + 6}", 
    :color => "color_#{i + 6}", 
    :image_url => "/images/bottoms/bottom#{i + 1}.jpeg", 
    :article_type_id => @bottom.id
  )
end

5.times do |i|
  o = Outfit.create(:date_worn => "4/#{i + 1}/2014") 
end

5.times do |i|
  OutfitArticle.create(:article_id => i + 1, 
                        :outfit_id => i + 1)
  OutfitArticle.create(:article_id => i + 6, 
                        :outfit_id => i + 1)
end
  
