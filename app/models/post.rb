class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true
  has_many :comments
end
