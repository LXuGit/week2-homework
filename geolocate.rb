require 'open-uri'
require 'json'

print "Enter an address, city or zipcode: "
input = gets
input = input.chomp
parameters = ""

if input.include? ' ' #convert empty spaces in the user input to +
  parameters = "address=" + input.tr(" ", "+") + "&sensor=true"
else
  parameters = "address=" + input + "&sensor=true"
end

json_data = open("http://maps.googleapis.com/maps/api/geocode/json?#{parameters}").read
data = JSON.parse(json_data)
result = data["results"][0]["geometry"]["location"]
puts "Latitude: #{result["lat"]}"
puts "Longitude: #{result["lng"]}"



