class Reservation < ActiveRecord::Base
	belongs_to :game
  belongs_to :player, :class_name => "User"

  # Three validations before creating a new reservation
  # 1. current_user != game.host
  # 2. game.players.length !> game.player_limit
  # 3. logged_in? == true

end
