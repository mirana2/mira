class PendingArticle < ApplicationRecord
    belongs_to :user
    belongs_to :category
    acts_as_approval_resource
end
