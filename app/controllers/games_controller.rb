class GamesController < ApplicationController

def new
	@game = Game.new
end

def edit
end

def create
	@game = Game.new(game_params)
	binding.pry
	if @game.save
		redirect_to @game, :notice => "Congrats! You're hosting a game!"
	end
end

def destroy
end

def show

end

private

def set_game
	@game = Game.find(params[:id])
end

def game_params
	params.require(:game).permit(:description, :date, :time, :game_category, :player_limit, :facility_id, :host_id)
end
end
