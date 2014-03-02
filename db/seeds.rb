require_relative '../config/environment.rb'

5.times do |i|
  Article.create(
    :subtype => "type_#{i + 1}", 
    :brand => "brand_#{i + 1}", 
    :color => "color_#{i + 1}", 
    :image_url => "#{i + 1}@example.com"
  )
end
