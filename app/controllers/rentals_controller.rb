class RentalsController < ApplicationController
  def new
    @deck = Deck.find(params[:list_id])
  end

  def create
  end
end
