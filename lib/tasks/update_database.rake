require 'open-uri'

desc 'update database from api'
  task :update_database => :environment do
    url = 'https://data.cityofnewyork.us/resource/e4ej-j6hn.json'
    json = JSON.load(open(url))

    # destroy
    # if not in parks JSON, but in db, destroy
     
    # create
    # if in parks JSON but not in db, create
    
    # update
    # if in parks JSON and in db, but info has changed, update
end
