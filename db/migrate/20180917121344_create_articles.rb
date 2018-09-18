class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :category, foreign_key: true
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
