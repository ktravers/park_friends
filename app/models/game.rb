class Game < ActiveRecord::Base
	belongs_to :facility
  belongs_to :host, :class_name => "Player"
  has_many :reservations
  has_many :players, through: :reservations
end
