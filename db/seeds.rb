require_relative '../config/environment.rb'

5.times do |i|
  Shoe.create(
    :subtype => "type_#{i}", 
    :brand => "brand_#{i}", 
    :color => "color_#{i}", 
    :image_url => "#{i}@example.com"
  )
end
