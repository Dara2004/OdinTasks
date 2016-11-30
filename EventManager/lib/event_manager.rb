require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def check_zipcode(zipcode)
	return zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
	return Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thankyou_letter(id,letter)
    Dir.mkdir("output") unless Dir.exists? "output"
    filename = "output/thanks#{id}.html"

    File.open(filename,'w') do |file|
    	file.puts letter
    end
end

puts "Event Manager Initialized"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |lines|
	id = lines[0]
	name = lines[:first_name]

  zipcode = check_zipcode(lines[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thankyou_letter(id,form_letter)
end