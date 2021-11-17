class Deck < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :structures, dependent: :destroy
  has_many :cards, through: :structures

  validates :name, presence: true
  validates :desc, presence: true
end
