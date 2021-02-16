arr = [1,2,3]

#Single line block
arr.each { |n| puts n }

puts '____________________'

#multiple line block
arr.each do |n| 
	puts n
	puts n*n
end

puts '____________________'

#yield keyword ( Implicit block )
sm = 0

# def Sum  arr
# 	arr.each do |n|
# 		sm += n
# 	end
# 	puts sm
# end

def print_sum 
	yield 3
end

# print_sum { puts 'yield called' } 
print_sum  { |num| puts num*num }

#explicit block
def print_sum (&block)
	return 'No block given' unless block_given?
	block.call 3
end

# print_sum { puts 'yield called' } 
print_sum  { |num| puts num*num }

puts '____________________'


# Class with yield keyword and block passing using object of a class
class Test_yield_with_parameter
	attr_accessor :name
	def initialize ( name )
		@name = name
	end
	def operation_on_name
		yield name  #passing array to yield
	end
end


test1 = Test_yield_with_parameter.new ( [1,2,3] )
puts test1.name

test1.operation_on_name do |name|
	
		name.each do |a|
			puts a
		end

	end

puts '____________________'

#Learning lambda 

test_lambda = -> { puts 'Tested lambda' }
test_lambda.call


