class DecksController < ApplicationController
  before_action :set_deck, only: [:show]
  def index
    # @decks = Deck.all
    if params[:query].present?
      @decks = policy_scope(Deck).global_search(params[:query])
    else
      @decks = policy_scope(Deck)
    end
  end

  def new
    @deck = Deck.new
    authorize @deck
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user
    authorize @deck
    if @deck.save
      redirect_to decks_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to decks_path
    authorize @deck
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :desc, :price)
  end

  def set_deck
    @deck = Deck.find(params[:id])
    authorize @deck
  end
end
