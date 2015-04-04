class Reservation < ActiveRecord::Base
	belongs_to :game
  belongs_to :player, :class_name => "User"
  validate :user_not_host, :game_not_full, on: :create

  # Three validations before creating a new reservation
  # 1. current_user != game.host
  # 2. game.players.length !> game.player_limit
  # 3. logged_in? == true

  def user_not_host
    if self.player_id == Game.find(self.game_id).host_id
      errors.add(:game, "You can't sign up for a game you're hosting.")
    end
  end

  # not necessary? button doesn't appear if game's full
  def game_not_full
    if !(Game.find(self.game_id).has_open_spots?)
      errors.add(:game, "Sorry, this game is full.")
    end
  end

  # def user_logged_in
  #   if !logged_in?
  #     errors.add(:game, "Please log in to join this game.")
  #   end
  # end

end
