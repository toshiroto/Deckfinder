class Deck < ApplicationRecord
  belongs_to :user
  has_many :rentals

  validates :name, presence: true
  validates :desc, presence: true
end
