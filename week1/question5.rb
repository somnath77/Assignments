# Question 5) Regex for mobile number, email address, name, gender(M / F), and amount,.

# REGEX for:
# 1. Mobile No: \A[1-9]{9,9}[0-9]$
# 2. Email ID:  \A([\w+].?)+@[a-z\d]+(\.[a-z]+)*\.[a-z]+\z
# 3. Name    :  \A([[a-zA-Z]+]+)\s+([[a-zA-Z]+]+)
# 4. Gender  :  \A[mfMF]\z
# 5. amount  :  \A[[1-9]+]+.[\d]*\z

mobile_no_regex = /\A[1-9]{9,9}[0-9]$/
email_id_regex = /\A([\w+].?)+@[a-z\d]+(\.[a-z]+)*\.[a-z]+\z/
name_regex = /\A([[a-zA-Z]+]+)\s+([[a-zA-Z]+]+)$/
gender_regex = /\A[mfMF]\z/
amount_regex = /\A[[1-9]+]+.[\d]*\z/

while true do
	puts "Please select a catagory to match the inputted data : \n 1. Mobile No \n2. Email ID \
		  \n 3. Name \n4. Gender \n5. Amount \n6. Exit \n SELECT: "
	opt = gets
	opt = opt.to_i

	if(opt >= 6)
		return
	end

	puts "Enter string to match :"
	str = gets.chop.to_s

	case opt
		when 1 
			if mobile_no_regex.match(str)
				puts "\nMobile no is valid\n"
			else
				puts "\nInvalid mobile no\n"
			end
		
		when 2 
			if email_id_regex.match(str)
				puts "\nEmail ID is valid\n"
			else
				puts "\nInvalid Email ID\n"
			end
		
		when 3 
			if name_regex.match(str)
				puts "\nName is valid\n"
			else
				puts "\nInvalid Name\n"
			end
		
		when 4 
			if gender_regex.match(str)
				puts "\nGender is valid\n"
			else
				puts "\nInvalid Gender\n"
			end
		when 5 
			if amount_regex.match(str)
				puts "\namount is valid\n"
			else
				puts "\nInvalid amount\n"
			end
		else
			return
		end
end