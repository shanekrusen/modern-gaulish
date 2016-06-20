class Category < ApplicationRecord
  has_many :posts
  has_many :comments
end
