require 'csv'
require 'sunlight/congress'
Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

template_letter = File.read "form_letter.html"
def clean_zipcode zipcode
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode zipcode
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
  legislators_names = legislators.collect {|person| "#{person.first_name} #{person.last_name}"}.join(", ")
end
puts "Event manager has been Initialized"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  zipcode = clean_zipcode row[:zipcode]
  legislators = legislators_by_zipcode zipcode
  puts "#{name} from #{zipcode} #{legislators}"
end
