class Reservation < ActiveRecord::Base
	belongs_to :game
  belongs_to :player, :class_name => "User"
  validate :user_not_host, on: :create #, :game_not_full, :user_logged_in
  # how to do custom validations?

  # Three validations before creating a new reservation
  # 1. current_user != game.host
  # 2. game.players.length !> game.player_limit
  # 3. logged_in? == true

  def user_not_host
    # binding.pry
    if self.player_id == Game.find(self.game_id).host_id
      errors.add(:game, "You can't sign up for a game you're hosting.")
    end
  end

  # def game_not_full
  #   if Game.find(self.game_id).has_open_spots? == true
  #     errors.add("")
  #   end
  # end

  # def user_logged_in
  #   logged_in? == true
  # end

end
