require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode zipcode
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone phone
  subs = {"("=>"", ")"=>"", "."=>"", "-"=>""}
  formatted_phone = phone.gsub(/[,-.() ]/, subs)

  return "0000000000" if formatted_phone.length < 10
  return formatted_phone if formatted_phone.length == 10

  if formatted_phone.length == 11 && formatted_phone.chr == "1"
    formatted_phone[1..-1]
  elsif formatted_phone.length == 11 && formatted_phone.chr != "1"
    "0000000000"
  else
    "0000000000"
  end
end

def legislators_by_zipcode zipcode
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters id, form_letter
  Dir.mkdir("output") unless Dir.exists? "output"
  filename = "output/thanks_#{id}.html"
  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end
puts "Event manager has been Initialized"
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter
contents.each do |row|
  id = row[0]
  zipcode = clean_zipcode row[:zipcode]
  phone = clean_phone row[:homephone]
  p phone

  #legislators = legislators_by_zipcode zipcode
  #form_letter = erb_template.result(binding)
  #save_thank_you_letters(id,form_letter)
end

