class RenameShoesToArticles < ActiveRecord::Migration
  def change
    rename_table(:shoes, :articles)
  end
end
