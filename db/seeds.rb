require_relative '../config/environment.rb'

5.times do |i|
  Article.create(
    :article_type => "top",
    :subtype => "type_#{i + 1}", 
    :brand => "brand_#{i + 1}", 
    :color => "color_#{i + 1}", 
    :image_url => "#{i + 1}@example.com"
  )
end

5.times do |i|
  Article.create(
    :article_type => "bottom",
    :subtype => "type_#{i + 6}", 
    :brand => "brand_#{i + 6}", 
    :color => "color_#{i + 6}", 
    :image_url => "#{i + 6}@example.com"
  )
end
