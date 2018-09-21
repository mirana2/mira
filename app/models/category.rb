class Category < ApplicationRecord
    has_many :articles
    has_many :pending_articles
end
