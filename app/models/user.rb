class User < ActiveRecord::Base
	has_many :games, :foreign_key => 'host_id'
	has_many :reservations, through: :games
  has_many :reservations, :foreign_key => 'player_id'

#   {
#   :provider => 'facebook',
#   :uid => '1234567',
#   :info => {
#     :email => 'joe@bloggs.com',
#     :first_name => 'Joe',
#     :last_name => 'Bloggs',
#     :image => 'http://graph.facebook.com/1234567/picture?type=square',
#   },
#   :credentials => {
#     :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
#     :expires_at => 1321747205, # when the access token expires (it always will)
#     :expires => true # this will always be true
#   },
# }

  def self.create_with_omniauth(auth)
    self.create do |user|
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.email = auth["info"]["email"]
      user.profile_picture = auth["info"]["image"]
      user.provider = auth["provider"] # not really necessary because of default
      user.uid = auth["uid"]
      user.token = auth["credentials"]["token"]             ### ???
      user.expires_at = auth["credentials"]["expires_at"]   ### ???
      user.expires = auth["credentials"]["expires"]         ### ???
    end
  end


end
