class Comment < ApplicationRecord
  belongs_to :user

  validates :isbn, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
end

