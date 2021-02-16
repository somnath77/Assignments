# Question 6) program to find the IP address class

puts "Enter valid IPV4 address: "
ip = gets

octate = ""

ip.split("").each do |i|
	if(i != '.')
		octate = octate + i
	else
		break
	end
end
octate = octate.to_i
puts octate
puts octate.class

case octate
when (0..127)
	puts "Class A"
when (127..191)
	puts "Class B"
when (192..223)
	puts "Class C"
when (224..239)
	puts "Class D"
when (240..255)
	puts "Class E"
else
	puts "Invalid IP"
end
