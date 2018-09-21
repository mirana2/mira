class Article < ApplicationRecord
  belongs_to :category
  acts_as_approval_resource
end
