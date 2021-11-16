class RentalsController < ApplicationController
  def new
    @deck = Deck.find(params[:deck_id])
    @rental = Rental.new
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @rental = Rental.new(rental_params)
    @rental.deck = @deck
    @rental.user = current_user
    if @rental.save
      redirect_to decks_path
    else
      render :new
    end
  end

private
  def rental_params
    params.require(:rental).permit(:deck_id, :user_id, :start_date, :end_date)
  end
end
