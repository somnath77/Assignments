# Question 2) Program to display number is prime or not.

puts "Enter integer number: "

num = gets 
num= num.to_i

if( num <= 1) 
	puts("Not Prime") 
	return 
end

sqrtOfNumber = Math.sqrt(num).to_i

(2..sqrtOfNumber).each do |i|
	if (num % i) == 0 
		puts "Not Prime"
		return 
	end	
end

puts "prime" ;


