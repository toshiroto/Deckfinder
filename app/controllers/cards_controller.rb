class CardsController < ApplicationController
  before_action :find_card, only: [:show]
  before_action :set_deck, only: [:show]

  # def index
  #   @cards = policy_scope(Card)
  # end

  def show
  end

  private

  def find_card
    @card = Card.find(params[:id])
  end

    def set_deck
    @deck = Card.find(params[:id])
    authorize @deck
  end
end
