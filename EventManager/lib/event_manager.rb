require 'csv'
require 'sunlight/congress'
require 'erb'
require 'time'

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

def peak_hours hash
  puts "Top 3 peak registration hours are:"
  hours = Hash[hash.sort_by{|_,v| v}.reverse[0..2]]
  hours.each {|k,v| puts "#{k} with #{v} votes" }
end

def peak_days hash
  puts "Top 3 peak registration days are:"
  days = Hash[hash.sort_by{|_,v| v}.reverse[0..2]]
  days.each {|k,v| puts "#{k}, with #{v} votes"}
end
puts "Event manager has been Initialized"

days = Hash.new(0)
hours = Hash.new(0)

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode row[:zipcode]
  phone = clean_phone row[:homephone]
  registration_date = Time.strptime(row[:regdate], '%m/%d/%y %H:%M')

  days[registration_date.strftime("%A")] += 1
  hours[registration_date.strftime("%l%P")] += 1

  #legislators = legislators_by_zipcode zipcode
  #form_letter = erb_template.result(binding)
  #save_thank_you_letters(id,form_letter)
end
peak_hours hours
puts
peak_days days
