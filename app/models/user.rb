class User < ActiveRecord::Base
  has_many :games, foreign_key: 'host_id'
  has_many :reservations, through: :games
  has_many :reservations, foreign_key: 'player_id', dependent: :destroy

  def self.create_with_omniauth(auth)
    self.create do |user|
      user.first_name = auth['info']['first_name']
      user.last_name = auth['info']['last_name']
      user.email = auth['info']['email']
      user.profile_picture = auth['info']['image']
      user.uid = auth['uid']
      user.token = auth['credentials']['token']
    end
    UserMailer.signup_confirmation(User.all.last).deliver
    User.all.last
  end

  # returns user's full name
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  # boolean check on whether user is a host
  def host?
    self.host
  end

  # returns array of all upcoming games user is involved with (as a host or player)
  def upcoming_games_all
    (upcoming_games_host | upcoming_games_player).sort
  end

  # returns array of upcoming games user is hosting
  def upcoming_games_host
    self.games.all.select { |g| g.date >= Date.today }.sort
  end

  # returns array of upcoming games user is playing (as a non-host)
  def upcoming_games_player
    games = []
    self.reservations.each do |r|
      games << r.game if r.game.date >= Date.today
    end
    games.sort
  end
end
