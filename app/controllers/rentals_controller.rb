class RentalsController < ApplicationController
before_action :set_rental, only: [:show, :edit]

def index
    @rentals = policy_scope(Rental)
  end

  def new
    @deck = Deck.find(params[:deck_id])
    @rental = Rental.new
    authorize @rental
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @rental = Rental.new(rental_params)
    @rental.deck = @deck
    @rental.user = current_user
    authorize @rental
    if @rental.save
      redirect_to decks_path
    else
      render :new
    end
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(rental_params)
    authorize @rental
    if @rental.save
      redirect_to decks_path
    else
      render :edit
    end

  end


  def edit
    # @rental = Rental.find(params[:id])
  end


private
  def rental_params
    params.require(:rental).permit(:deck_id, :user_id, :start_date, :end_date)
  end

  def set_rental
    @rental = Rental.find(params[:id])
    authorize @rental
  end
end
