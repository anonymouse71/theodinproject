puts "Event manager has been Initialized"

lines = File.readlines "event_attendees.csv"
lines.each do |line|
  columns = line.split(",")
  p columns
end
