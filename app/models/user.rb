class User < ActiveRecord::Base
	has_many :games, :foreign_key => 'host_id'
	has_many :reservations, through: :games
  has_many :reservations, :foreign_key => 'player_id'
end
