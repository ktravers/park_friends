class Park < ActiveRecord::Base
  has_many :games
  has_many :reservations, through: :games
  has_one :activity_park
  has_one :activity, through: :activity_park
end
