require 'csv'
puts "Event manager has been Initialized"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]

  zipcode = "00000" if zipcode.nil?
  if zipcode.length < 5
    zipcode.rjust 5, "0"
  elsif zipcode.length > 5
    zipcode[0..4]
  end
  p "#{name} from #{zipcode}"
end
