class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rentals
  has_many :rented_decks, through: :rentals, source: :deck
  has_many :owned_decks, class_name:"Deck"


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
