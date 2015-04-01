class Park < ActiveRecord::Base
	has_many :games
	has_many :reservations, through: :games

  # activities => 
  # [ "Bocce Courts", 
  #   "Basketball Courts", 
  #   "Tennis Courts", 
  #   "Football Fields", 
  #   "Ice Skating Rinks", 
  #   "Playgrounds", 
  #   "Bathrooms", 
  #   "Baseball Fields", 
  #   "Beaches", 
  #   "Nature Centers", 
  #   "Recreation Centers", 
  #   "Pools" ] 

end
