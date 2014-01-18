require 'open-uri'
require 'json'

def addr_convert(str)
  if str.include? ' ' #convert empty spaces in the user input to +
    str = str.tr(" ", "+")
   end
   return str
end


print "Enter an origin address: "
input1 = gets
input1 = input1.chomp
origin = addr_convert(input1)

print "Enter a destination address: "
input2 = gets
input2 = input2.chomp
destination = addr_convert(input2)


parameters = "origin=" + origin + "&destination=" + destination + "&sensor=false"


json_data = open("http://maps.googleapis.com/maps/api/directions/json?#{parameters}").read
data = JSON.parse(json_data)
distance = data["routes"][0]["legs"][0]["distance"]["text"]
duration = data["routes"][0]["legs"][0]["duration"]["text"]
puts "Total travel time driving: #{duration}"
puts "Total distance travelled: #{distance}"