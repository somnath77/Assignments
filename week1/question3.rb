# Question 3) program for students to print their school level according to grade 
	# e.g - if the grade is between 1-5 return to elementary 
	# 	  if the grade is between 6-8 return to middle school 
	# 	  if the grade is between 9-12 return to high school 
	# 	  if the grade is between otherwise return college
while true do
 	puts "Enter integer your school grade( enter 0 to exit): "

	grade = gets 
	grade= grade.to_i

	if(grade == 0 )
		return
	end

	if( grade < 0) 
		puts("Invalid Grade") 
		return 
	end

	case grade
	when (1..5)
		puts "elementary"
	when (6..8)
		puts "middle school"
	when (9..12)
		puts "high school"
	else 
		puts "college"
	end
end