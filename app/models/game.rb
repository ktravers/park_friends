class Game < ActiveRecord::Base
	belongs_to :park
  belongs_to :host, :class_name => "User"
  has_many :reservations, :dependent => :destroy
  has_many :players, :class_name => "User", through: :reservations
  accepts_nested_attributes_for :reservations

  # boolean check - does this game have any reservations?
  def has_reservations?
    self.reservations.length > 0
  end

  # boolean check - does this game have any open spots?
  def has_open_spots?
    open_spots > 0
  end
  # returns number of open spots
  def open_spots
    if has_reservations?
      self.player_limit - self.reservations.length  
    else
      self.player_limit
    end
  end

  def game_categories
    { "Baseball" => "Baseball Fields", "Basketball" => "Basketball Courts", "Bocce" => "Bocce Courts",  
      "Football" => "Football Fields", "Skating" => "Ice Skating Rinks", "Swimming" => "Pools", 
      "Tennis"  => "Tennis Courts", "Other" => ["Playgrounds", "Beaches", "Nature Centers", "Recreation Centers"] }
    # ["Bocce Courts", "Basketball Courts", "Tennis Courts", "Football Fields", "Ice Skating Rinks", "Playgrounds", "Baseball Fields", "Beaches", "Nature Centers", "Recreation Centers", "Pools"]
  end

end
