class Player < ActiveRecord::Base
	has_many :games, :foreign_key => 'host_id'  
	has_many :reservations, through: :games 
end
