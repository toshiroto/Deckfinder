class Rental < ApplicationRecord
  belongs_to :deck
  belongs_to :user
  enum status: { pending: 0, approved: 1, rejected: 2 }

  validates :start_date, presence: true
  validates :end_date, presence: true

  def pending?
    status == 'pending'
  end
end
