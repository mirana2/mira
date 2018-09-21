class CreatePendingArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :pending_articles do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :lien
      t.string :image_url
      t.string :icon_url
      t.string :description
      t.string :tuto

      t.timestamps
    end
  end
end
