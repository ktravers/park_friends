class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create, :edit, :update]
  before_action :login_required, only: [:edit, :update, :new, :create, :destroy, :invite]

  def invite
    @game = Game.find(params[:game_id])
    @user = User.find(params[:user_id])
    UserMailer.invitation(@game, @user).deliver
    redirect_to @game, :notice => 'Invitation sent!'
  end

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show
    @weather = Wunderground.new(ENV['wu_key'])
    # @reservation = @game.reservations.find_by(:player_id => current_user.id)
  end

  # creates new game object from params hash
  def create
    @game = Game.new(game_params)
    if @game.save
      @user.host = true
  	  redirect_to @game, :notice => "Congrats! You're hosting a game."
    end
  end

  # update game attributes
  def update
    if @game.update(game_params)
      redirect_to @game, :notice => 'Game updated.'
    else
      redirect_to @game, :notice => 'Sorry, unable to update game.'
    end
  end

  # destroy game and dependents (reservations)
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_path }
      # format.json { head :no_content }
    end
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
    params.require(:game).permit(:id, :description, :date, :time, :game_category, :player_limit, :park_id, :host_id, :additional_info, reservations_attributes: [:player_id, :game_id])
  end

end
