class ReservationsController < ApplicationController

  def new 
    @reservation = Reservation.new
  end

  # good spot to ajax?
  def create
    @reservation = Reservation.new(game_params)
    if @reservation.save
      # redirect_to @reservation, :notice => "Congrats! You're playing a game!"
    end
  end

end