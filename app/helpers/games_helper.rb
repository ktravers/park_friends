module GamesHelper

  def current_user_is_host?
    # binding.pry
    logged_in? && (current_user.id == @game.host_id)
  end

  def player_not_signed_up?
    logged_in? && !current_user_is_host? && !@game.players.include?(current_user)
  end

end