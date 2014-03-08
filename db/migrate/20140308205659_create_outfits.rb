class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.date :date_worn

      t.integer :user_id

      t.timestamps
    end
  end
end
