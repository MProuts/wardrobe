require_relative '../config/environment.rb'

binding.pry
5.times do |i|
  Article.create(
    :article_type => "top",
    :subtype => "type_#{i + 1}", 
    :brand => "brand_#{i + 1}", 
    :color => "color_#{i + 1}", 
    :image_url => "/images/tops/top#{i + 1}.jpeg"
  )
end

5.times do |i|
  Article.create(
    :article_type => "bottom",
    :subtype => "type_#{i + 6}", 
    :brand => "brand_#{i + 6}", 
    :color => "color_#{i + 6}", 
    :image_url => "/images/bottoms/bottom#{i + 1}.jpeg"
  )
end
