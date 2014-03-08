class CreateShoes < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :subtype
      t.string :brand
      t.string :color
      t.string :image_url

      t.integer :user_id
      t.integer :article_type_id

      t.timestamps
    end
  end
end
