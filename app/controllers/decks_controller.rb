class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def new
    @decks = Deck.new
  end

  def create
    @deck = Deck.new(params[:deck])
    @deck.save
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :desc, :price)
  end
end
