class Comment < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  belongs_to :post, dependent: :destroy
  belongs_to :category, dependent: :destroy
end
