require 'csv'
puts "Event manager has been Initialized"

contents = CSV.open "event_attendees.csv", headers: true
contents.each do |row|
  name = row[2]
  p name
end
