class ReadingStatus < ApplicationRecord
  belongs_to :user

  STATUSES = ['читаю', 'прочитал', 'хочу прочитать'].freeze

  validates :isbn, presence: true
  validates :status, inclusion: { in: STATUSES, message: "Invalid status. Available statuses: #{STATUSES.join(', ')}" }
end
