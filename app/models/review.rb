class Review < ApplicationRecord
  belongs_to :user

  validates :isbn, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }

  def as_json(options = {})
    super(options).merge(user_email: user.email)
  end
end
