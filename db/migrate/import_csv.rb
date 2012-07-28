require 'geocoder'
require 'csv'


CSV.foreach('/users/student/dev/scratch/Instaconcert/db/migrate/olymp_db_fornow.csv', :headers => true ) do |row|
  a = Event.new 
  a.name = row[2] + "'s " + row[0] 

  if row[4][3,5] == 'Aug' then
    a.min_timestamp = DateTime.new(2012,8,row[4][0,2].to_i,row[5][0,2].to_i,row[5][3,4].to_i,00).to_i
    a.max_timestamp = DateTime.new(2012,8,row[4][0,2].to_i,row[6][0,2].to_i,row[6][3,4].to_i,00).to_i
    a.start_time  = DateTime.new(2012,8,row[4][0,2].to_i,row[5][0,2].to_i,row[5][3,4].to_i,00)
  else
    a.min_timestamp = DateTime.new(2012,7,row[4][0,2].to_i,row[5][0,2].to_i,row[5][3,4].to_i,00).to_i
    a.max_timestamp = DateTime.new(2012,7,row[4][0,2].to_i,row[6][0,2].to_i,row[6][3,4].to_i,00).to_i
    a.start_time  = DateTime.new(2012,7,row[4][0,2].to_i,row[5][0,2].to_i,row[5][3,4].to_i,00)
  end  
  
  a.venue_name = row[8]
  sleep(1)
  a.lat = Geocoder.coordinates(a.venue_name)[0]
  a.long = Geocoder.coordinates(a.venue_name)[1]
  
  
  a.distance = 500
  a.save

end