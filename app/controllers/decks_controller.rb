class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user
    if @deck.save
      redirect_to decks_path
    else
      render :new
    end
  end

  def show
    @deck = Deck.find(params[:id])
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :desc, :price)
  end
end
