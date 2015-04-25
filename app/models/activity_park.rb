class ActivityPark < ActiveRecord::Base
  belongs_to :activity
  belongs_to :park
end
