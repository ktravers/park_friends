class Activity < ActiveRecord::Base
  has_many :activity_parks
  has_many :parks, through: :activity_parks
  # has_many :games
end
