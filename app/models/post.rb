class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true
  has_many :comments, :dependent => :destroy
  has_many :user_notifications, :dependent => :destroy
end
