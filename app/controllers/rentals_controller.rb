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
      redirect_to rentals_path
    else
      render :new
    end
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(rental_params)
    authorize @rental

    if @rental.save
      redirect_to deck_path(@rental.deck)
    else
      render :edit
    end

  end

  def show
  end

  def edit
    # @rental = Rental.find(params[:id])
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to rentals_path
    authorize @rental
  end


private
  def rental_params
    params.require(:rental).permit(:deck_id, :user_id, :start_date, :end_date, :status)
  end

  def set_rental
    @rental = Rental.find(params[:id])
    authorize @rental
  end
end
