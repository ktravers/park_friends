class Park < ActiveRecord::Base
  has_many :games
  has_many :reservations, through: :games
end
