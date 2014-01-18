require 'open-uri'
require 'json'


def find_location (input) #convert user input to geo-coordinates to get a more accurate result for weather search
  parameters = ""
  
  if input.include? ' ' #convert empty spaces in the user input to +
    parameters = "address=" + input.tr(" ", "+") + "&sensor=true"
  else
    parameters = "address=" + input + "&sensor=true"
  end
  
  json_data = open("http://maps.googleapis.com/maps/api/geocode/json?#{parameters}").read
  data = JSON.parse(json_data)
  lat = data["results"][0]["geometry"]["location"]["lat"]
  lon = data["results"][0]["geometry"]["location"]["lng"]

  result = "lat=#{lat}&lon=#{lon}&units=imperial" #format the search terms
  return result
end


print "Please enter an address: "
input = gets
input = input.chomp
location = find_location(input)

json_weather = open("http://api.openweathermap.org/data/2.5/weather?#{location}").read
weather = JSON.parse(json_weather)
temp = weather["main"]["temp"]
print "#{temp}f"

