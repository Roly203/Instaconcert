require 'csv'


CSV.foreach('/users/student/dev/scratch/Instaconcert/db/migrate/eventgroup-name.csv', :headers => true ) do |row|
  
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