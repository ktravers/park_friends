module GamesHelper

  # boolean check on whether currently logged in user is a host
  def current_user_is_host?
    logged_in? && (current_user.id == @game.host_id)
    # binding.pry
  end

  # boolean check on whether currently logged in user is signed up for game
  def current_user_signed_up?
    logged_in? && !current_user_is_host? && @game.players.include?(current_user)
  end

end