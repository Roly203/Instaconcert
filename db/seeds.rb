# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'geocoder'
require 'csv'


CSV.foreach("#{ENV['OPENSHIFT_GEAR_DIR']}runtime/repo/lib/data/new_db.csv", :headers => true ) do |row|
  a = Event.new 
  a.name = row[2] + "'s " + row[0] 

  if row[4].include? 'Aug' then
    a.min_timestamp = DateTime.new(2012,8,row[4][0,2].to_i,row[5][0,2].to_i,row[5][3,4].to_i,00).to_i
    a.max_timestamp = DateTime.new(2012,8,row[4][0,2].to_i,row[6][0,2].to_i,row[6][3,4].to_i,00).to_i
    a.start_time  = DateTime.new(2012,8,row[4][0,2].to_i,row[5][0,2].to_i,row[5][3,4].to_i,00)
  else
    a.min_timestamp = DateTime.new(2012,7,row[4][0,2].to_i,row[5][0,2].to_i,row[5][3,4].to_i,00).to_i
    a.max_timestamp = DateTime.new(2012,7,row[4][0,2].to_i,row[6][0,2].to_i,row[6][3,4].to_i,00).to_i
    a.start_time  = DateTime.new(2012,7,row[4][0,2].to_i,row[5][0,2].to_i,row[5][3,4].to_i,00)
  end  
  
  a.details = row[1]
  a.venue_name = row[8]
  #sleep(1)
  #a.lat = Geocoder.coordinates(a.venue_name)[0]
  #a.long = Geocoder.coordinates(a.venue_name)[1]
  
  a.lat = row[9]
  a.long = row[10]
  a.distance = row[11]

  a.save

end

CSV.foreach("#{ENV['OPENSHIFT_GEAR_DIR']}runtime/repo/lib/data/eventgroup-name.csv", :headers => true ) do |row|
  
  if !Eventgroup.find_by_name(row[0])
    eg = Eventgroup.new
    eg.name = row[0]
    eg.save
  end
  
  Event.where(:name => row[1]).each do |event|
    event.eventgroup_id = Eventgroup.find_by_name(row[0]).id
    event.save
  end
end