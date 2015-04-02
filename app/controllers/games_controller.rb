class GamesController < ApplicationController
  
  def new
    set_user
  	@game = Game.new
  end

  def show
  end

  # creates new game object from params hash
  def create
    set_user
  	@game = Game.new(game_params)
  	if @game.save
  		redirect_to @game, :notice => "Congrats! You're hosting a game!"
      # idea: have :notice display something like 
      # "Congrats! Your #{@game.game_category} is scheduled for #{@game.date} at #{@game.time}."
      # "Now invite some friends!" => as a link to our mailer
  	end
  end

  def edit
  end

  def destroy
  end

  private
    # finds existing game object in database using params[:id]
    def set_game
    	@game = Game.find(params[:id])
    end

    # sets @user to current_user
    def set_user
      @user = current_user
    end

    # strong params
    def game_params
    	params.require(:game).permit(:description, :date, :time, :game_category, :player_limit, :park_id, :host_id, :additional_info)
    end
end
