class Comment < ApplicationRecord
  belongs_to :user

  validates :isbn, presence: true
  validates :content, presence: true, length: { maximum: 1000 }

  def as_json(options = {})
    super(options).merge(user_email: user.email)
  end
end

