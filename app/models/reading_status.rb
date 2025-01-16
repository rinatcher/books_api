class ReadingStatus < ApplicationRecord
  belongs_to :user

  STATUSES = ['not read', 'reading', 'read', 'want to read'].freeze

  validates :isbn, presence: true
  validates :status, inclusion: { in: STATUSES, message: "Invalid status. Available statuses: #{STATUSES.join(', ')}" }
end
