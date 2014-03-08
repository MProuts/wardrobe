class CreateOutfitArticles < ActiveRecord::Migration
  def change
    create_table :outfit_articles do |t|
      t.integer :outfit_id
      t.integer :article_id

      t.timestamps
    end
  end
end
