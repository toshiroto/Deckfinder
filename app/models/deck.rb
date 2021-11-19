class Deck < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :structures, dependent: :destroy
  has_many :cards, through: :structures

  validates :name, presence: true
  validates :desc, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: {
      name: 'A',
      desc: 'B'
    },
    associated_against: {
      cards: [ :name, :text ]
    },
    using: {
      tsearch: { prefix: true }
    }

    def popularity
     self.rentals.count * 1000 / Rental.count unless Rental.count.zero?
    end
end
