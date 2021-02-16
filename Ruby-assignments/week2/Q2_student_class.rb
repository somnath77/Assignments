# Question 2. Develop a CLI application with some user inputs, for student management, 
# Use class, attribute accessor and all other concepts we learned today - 
# i. Input student roll number, and display students result with details of marks 
# and total percentage. Note - You can define array of hashes to have some students data.
# {
# 	Why what and How OOPs
# 	Classes
# 	class methods and instance methods
# 	Access specifiers
# 	Getters and setters
# }

# Defining student class to store students records
# To encapsulate student attributes( Vaiables ) and methods together , using class here
class Student
	Student_arr = [] # (Array of hashes)Array to store student data in the form of hashes 

	attr_accessor :roll_no, :name , :marks # Useful to both read and write data
 
	# making add, find, getAll methods private to provide abstraction and accessing those methods by a call from public methods
	private
	def add
		# getting data from user and storing it into hash and then pushing that hash into array
		puts "Enter roll no:"
		roll_no =  gets.chop.to_i
		puts "Enter name:"
		name =  gets.chop.to_s
		marks = []
		puts "Enter marks of 4 subjects one by one:"
		4.times do |n|
			n = gets.chop.to_i
			marks.append(n)
		end

		@roll_no = roll_no
		@name = name
		@marks = marks

		#I'll create a hash of this info and push that hash to Student_arr array
		hash1 = { :roll_no => roll_no , :name => name , :marks => marks } 
		Student_arr.push ( hash1 )
	end

	def find
		puts "Enter roll no to find"
		find_roll = gets.chop.to_i
		
		# aking roll no to find from user and searching in array of hash
		Student_arr.each do | student_data |
				if ( student_data[:roll_no] == find_roll )
					# flg = 1
					s1 = student_data[:roll_no]
					s2 = student_data[:name]
					s3 = student_data[:marks]
					puts '_________________'
					# puts student_data[:roll_no] , student_data[:name] , student_data[:marks] , '_______________'
					puts 'Roll_NO  Name  Marks'
					puts " #{s1}  #{s2}  #{s3} ",' _______________'
					return
				end
		end
		# if ( flg == 0)
		puts "Not found"
		# end
	end

	def getAll # Prining data of all students
		puts 'Roll_NO  Name  Marks'
		Student_arr.each do | student_data |
			# if ( student_data[:roll_no] == find_roll )
				flg = 1
				s1 = student_data[:roll_no]
				s2 = student_data[:name]
				s3 = student_data[:marks]
				# puts '_________________'
				# puts student_data[:roll_no] , student_data[:name] , student_data[:marks] , '_______________'
				
				puts " #{s1}  #{s2}  #{s3} "
			# end
		end
		puts '_________________'
	end

	def result
		puts "Enter roll No:"
		roll = gets.chop.to_i
		flg = 0

		# First of all I'll find the roll_no form array of hashes and then use data of that perticular hash
		# for result calculation
		Student_arr.each do | student_data |
			if ( student_data[:roll_no] == roll )
				flg = 1
				s1 = student_data[:roll_no]
				s2 = student_data[:name]
				s3 = student_data[:marks]
				# puts '_________________'
				# puts student_data[:roll_no] , student_data[:name] , student_data[:marks] , '_______________'
				
				puts " #{s1}  #{s2}  #{s3} "

				total_marks = 0
				s3.each do |mark|
					# flg = 0
					
					total_marks += mark
					if(mark < 35)  # Student is fail if he has got less than 35 marks in any subject and no need to process further
						puts "Failed !"
						return
					end
					# end
				end

				percentage = total_marks / 4
				# if ( flg == 0)
				puts "passed with #{total_marks} / 400 and percentage : #{percentage} %"

			end
		end
		if ( flg == 0)
			puts "Student Not found"
		end
	end

	# Making these methods public as these don't have any major method definition and logic is written in private methods.
	# Used only to call private methods
	public
	def addData # Setter method
		add
	end
	def findData  # getter method
		find
	end
	def getAllData # getter method
		getAll
	end
	def getResult # Method to get result
		result
	end

	#All these private and public  methods are instance methods as I don't need any class level
	# information , so no need of class method
end

s = Student.new # initializing object

# Menudriven code for student management
while true
	# sleep(1)
	puts '_________________',"Student Manager ",'1. Add new student','2. Find student record','3. Get all data','4. Get result','5. Exit','CHOOSE OPTION:'
	option = gets.chop.to_i
	puts '_________________'
	return if option > 4

	case option
	when 1
		s.addData
	when 2
		s.findData
	when 3
		s.getAllData
	when 4
		s.getResult
	end
end