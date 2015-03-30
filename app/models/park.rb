class Park < ActiveRecord::Base
	has_many :facilities
	has_many :games, through: :facilities
	has_many :reservations, through: :games
end
