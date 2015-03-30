class Facility < ActiveRecord::Base
	belongs_to :park
	has_many :games
	has_many :reservations, through: :games
end
