# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'open-uri'

url = 'https://data.cityofnewyork.us/resource/e4ej-j6hn.json'
json = JSON.load(open(url))

json.each do |park|
  park = Park.create(:name => park['name'], :location => park['location'], :facility => park['type']) unless park['type'] == 'Bathroom'
  park_activity = ''
  park_facility = Park.all.last.facility # most recently created Park object's facility attribute

  case park_facility
  when 'Ice Skating Rinks'
    park_activity = 'Ice Skating'
  when 'Bocce Courts'
    park_activity = 'Bocce'
  when 'Basketball Courts'
    park_activity = 'Basketball'
  when 'Tennis Courts'
    park_activity = 'Tennis'
  when 'Football Fields'
    park_activity = 'Football'
  when 'Baseball Fields'
    park_activity = 'Baseball'
  end

  activity = Activity.find_or_create_by(:name => park_activity)
  ActivityPark.create(:park_id => park.id, :activity_id => activity.id)
end

User.create(first_name: 'Leslie', last_name: 'Knope', email: 'leslie@pawneeparks.gov', zipcode: '11217', profile_picture: 'http://38.media.tumblr.com/avatar_c964046726bd_128.png', favorite_games: 'Basketball, Football, Tennis', host: false, provider: 'facebook', uid: nil, token: nil)
User.create(first_name: 'Ron', last_name: 'Swanson', email: 'ron@pawneeparks.gov', zipcode: '11211', profile_picture: 'http://38.media.tumblr.com/avatar_c61787a2f2a8_128.png', favorite_games: 'Ice Skating, Tennis', host: false, provider: 'facebook', uid: nil, token: nil)
User.create(first_name: 'Tom', last_name: 'Haverford', email: 'tom@pawneeparks.gov', zipcode: '10001', profile_picture: 'http://33.media.tumblr.com/avatar_f0eda096578c_128.png', favorite_games: 'Bocce, Tennis, Swimming', host: true, provider: 'facebook', uid: nil, token: nil)
User.create(first_name: 'April', last_name: 'Ludgate', email: 'april@pawneeparks.gov', zipcode: '10001', profile_picture: 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash2/v/t1.0-1/c14.14.172.172/s50x50/532819_214610251993778_13027322_n.jpg?oh=0fe009be50955fd755b792966ce2abc0&oe=55B0D91D&__gda__=1437733086_5dba88b8e2d8915639d2961c381c61c4', favorite_games: 'Basketball', host: false, provider: 'facebook', uid: nil, token: nil)
User.create(first_name: 'Andy', last_name: 'Dwyer', email: 'andy@pawneeparks.gov', zipcode: '10001', profile_picture: 'https://33.media.tumblr.com/avatar_50a6b2708aaa_128.png', favorite_games: 'Basketball', host: false, provider: 'facebook', uid: nil, token: nil) 
User.create(first_name: 'Ben', last_name: 'Wyatt', email: 'ben@pawneeparks.gov', zipcode: '11215', profile_picture: 'http://33.media.tumblr.com/avatar_4b3f765f50c0_64.png', favorite_games: 'Baseball, Tennis, Swimming, Football', host: true, provider: 'facebook', uid: nil, token: nil)

Game.create(description: 'Cool Tennis Party', date: '2015-08-12', time: '2000-01-01 16:30:00', game_category: 'Tennis', player_limit: 4, park_id: 65, host_id: 1, additional_info: 'We need a volunteer ref.')
Game.create(description: 'Sunday Soccer', date: '2015-06-06', time: '2000-01-01 16:30:00', game_category: 'Soccer', player_limit: 20, park_id: 44, host_id: 2, additional_info: 'Bring snacks') 
Game.create(description: 'NBA Jam', date: '2015-11-08', time: '2000-01-01 16:30:00', game_category: 'Basketball', player_limit: 10, park_id: 11, host_id: 3, additional_info: 'Need rackets') 
Game.create(description: 'Futbol Not Football', date: '2015-11-06', time: '2000-01-01 16:30:00', game_category: 'Soccer', player_limit: 16, park_id: 44, host_id: 4, additional_info: 'Bring extra shin guards.') 
Game.create(description: 'Ruby-bowl 007', date: '2015-07-21', time: '2000-01-01 18:30:00', game_category: 'Football', player_limit: 10, park_id: 239, host_id: 5, additional_info: 'Bring water.') 
Game.create(description: 'Bocce Club', date: '2015-09-17', time: '2000-01-01 10:00:00', game_category: 'Bocce', player_limit: 8, park_id: 393, host_id: 6, additional_info: 'Someone bring a rule book this time.')

Reservation.create(game_id: 1, player_id: 2) 
Reservation.create(game_id: 1, player_id: 3) 
Reservation.create(game_id: 2, player_id: 1) 
Reservation.create(game_id: 2, player_id: 3) 
Reservation.create(game_id: 3, player_id: 2) 
Reservation.create(game_id: 3, player_id: 4) 
Reservation.create(game_id: 4, player_id: 3) 
Reservation.create(game_id: 4, player_id: 5) 
Reservation.create(game_id: 5, player_id: 4) 
Reservation.create(game_id: 5, player_id: 6)
Reservation.create(game_id: 6, player_id: 5)
Reservation.create(game_id: 6, player_id: 1)
