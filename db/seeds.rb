# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'open-uri'

  # {
  # location: "Arthur Avenue & East Tremont Avenue",
  # name: "Tremont Park",
  # type: "Bocce Courts"
  # },
  # => 805 parks total

url = "https://data.cityofnewyork.us/resource/e4ej-j6hn.json"
json = JSON.load(open(url))

json.each do |park|
  Park.create(:name => park["name"], :location => park["location"], :activity => park["type"])  
end
