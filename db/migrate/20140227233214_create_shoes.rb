class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :subtype
      t.string :brand
      t.string :color
      t.string :image_url

      t.timestamps
    end
  end
end
