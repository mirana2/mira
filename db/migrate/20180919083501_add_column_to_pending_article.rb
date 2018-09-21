class AddColumnToPendingArticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :pending_articles, :category, foreign_key: true
  end
end
