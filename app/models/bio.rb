class Bio < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
