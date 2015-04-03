class Game < ActiveRecord::Base
	belongs_to :park
  belongs_to :host, :class_name => "User"
  has_many :reservations
  has_many :players, :class_name => "User", through: :reservations

  # boolean check
  def has_reservations?
    self.reservations.length > 0
  end

  def open_spots
    if has_reservations?
      self.player_limit - self.reservations.length
      if (self.player_limit - self.reservations.length) == 0
        "Sorry! This game is full."
      end
    else
      self.player_limit
    end
  end

end
