
#Using csv file to store countries data, so need to include packages for it
require 'csv'

#A main class Countries which have all data, getter, setter methods, and some methods to get specific data of countries
class Countries
	attr_accessor :name, :population, :gdp, :army_strength, :state, :isUNMember , :isImfMember
	
	def add
		puts 'Enter country name :'
		name = gets.chop.to_s

		#Before writing data of a new country, it will check if there exist data of that country already in file
		if File.exist?("country_data.csv")
			arr = CSV.read("country_data.csv")
			arr.each do |a|
				if(a[0] == name)
					puts "Data of #{name} already exist"
					return
				end
			end
		end

		puts 'Enter population in millions :'
		population = gets.chop.to_s
		puts 'Enter GDP in billion USD:'
		gdp = gets.chop.to_s
		puts 'Enter army strength in thousands:'
		army_strength = gets.chop.to_s
		puts 'Enter state of country:'
		state = gets.chop.to_s
		puts 'Is country IMF member ? Enter 1 if yes 0 if no'
		isImfMember = gets.chop.to_s
		puts 'Is country UN member ? Enter 1 if yes 0 if no'
		isUNMember = gets.chop.to_s

		hashes = [{ 'name' => name, 'population' => population, 'gdp' => gdp, 'army_strength' => army_strength, 'state' => state, 'isImfMember' => isImfMember, 'isUNMember' => isUNMember }]
		# CSV.open("country_data.csv", 2"w",headers: hashes.first.keys) {|csv| hash.to_a.each {|elem| csv << elem} }
		
		# All data will be added into a hash and push that hash into file.
		CSV.open("country_data.csv", "a", headers: hashes.first.keys) do |csv|
		    hashes.each do |h|
		      csv << h.values
		    end
		  end
	end
	#Function to read all data from file
	def read
		# All data from file will be loaded into an array and that array .  
		arr = CSV.read("country_data.csv") # arr is basically array of array now
		puts "[Country_name, population(in Bn), GDP(in Bn), Army strength(in thousands) , isImfMember , isUNMember ]"
		arr.each do |a|
			print a
			puts "\n"
			# if(a[0] == 'tr')
			# 	puts a
			# end
		end
	end

	# getSpecific methods will return data of perticular country
	def getSpecific
		puts 'Enter country name ( First letter must be capital )'
		name = gets.chop.to_s

		arr = CSV.read("country_data.csv")
		puts "[Country_name, population(in Bn), GDP(in Bn), Army strength(in thousands), State , isImfMember , isUNMember ]"
		arr.each do |a|
			if(a[0] == name)
				puts "\n\nCountry name : #{a[0]}", "Population : #{a[1]} Bn", "GDP : #{a[2]} Bn"
				puts "Army strength : #{a[3]} thousands","State : #{a[4]} " , "IMF member ? : #{a[5]} ","UN member ? : #{a[6]} \n"
				return
			end
		end
		puts " #{name} Country data not found"
	end

	def getImfMembership # It will return whether that country is member of IMF or not
		puts 'Enter country name ( First letter must be capital )'
		name = gets.chop.to_s

		arr = CSV.read("country_data.csv")
		arr.each do |a|
			if(a[0] == name)
				return a[5]
			end
		end
		return -1
	end

	def getUNMembership # It will return whether that country is member of UN or not
		puts 'Enter country name ( First letter must be capital )'
		name = gets.chop.to_s

		# Below are 5 permanent members of UN security council, so checking already and returning
		if(name == 'USA' || name == 'France' || name == 'China' || name == 'Russia' || name == 'UK' )
			return 2
		end

		arr = CSV.read("country_data.csv")
		arr.each do |a|
			if(a[0] == name)
				return a[6]
			end
		end
		return -1
	end

	def getArmyStrength(name) # It will return army strength f a country
		# puts 'Enter country name ( First letter must be capital )'
		# name = gets.chop.to_s

		arr = CSV.read("country_data.csv")
		arr.each do |a|
			if(a[0] == name)
				return a[6]
			end
		end
		return -1
	end
end

# cntry = Countries.new

# A module with getter and setter methods
module ReadWrite
	def addNew
		cntry = Countries.new
		cntry.add
	end
	def readData
		cntry = Countries.new
		cntry.read
	end
	def getSpecificCountry
		cntry = Countries.new
		cntry.getSpecific
	end
end

# A module for IMmembership  functionality
module IMF 
	
	def canGetLoanFromIMF?
		cntry = Countries.new
		flg = cntry.getImfMembership
		
		if (flg == '1')
			puts "\n Yes. This Country can get loan from IMF \n"
		elsif( flg == '0')
			puts "\n No. This Country can't' get loan from IMF \n"
		else
			puts "\n Country data not found \n"
		end
	end
end

# A module for security council membership functionality
module UN 
	
	def canBecomeSecurityCouncilMember?
		cntry = Countries.new
		flg = cntry.getUNMembership
		if (flg == 2)
			puts "This country is permanent member of Security council"
		elsif (flg == '1')
			puts "\n Yes. This Country can become Security Council member \n"
		elsif( flg == '0')
			puts "\n No. This Country can't' become Security Council member \n"
		else
			puts "\n Country data not found \n"
		end
	end
end

# A module for who wil win war functionality
module War
	
	def canWinWar?
		puts 'Enter country name ( First letter must be capital )'
		name1 = gets.chop.to_s
		cntry = Countries.new
		army_strength_1 = cntry.getArmyStrength(name1).chop.to_i

		puts 'Enter opposition country name ( First letter must be capital )'
		name2 = gets.chop.to_s
		# cntry = Countries.new
		army_strength_2 = cntry.getArmyStrength(name2).chop.to_i

		if( army_strength_1 == -1)
			puts "#{name1}\'s Data not found"
		elsif( army_strength_2 == -1)
			puts "#{name2}\'s Data not found"
		elsif (army_strength_1 > army_strength_2)
			puts "#{name1}  can win against #{name2}"
		else
			puts "#{name1}  can't win against #{name2}"
		end
	end
end


# Below class will include all the modules and will have access 
# to all the methods and data, using object of this class, 
# we will perform all the operations
class Country_class_final
	include IMF , ReadWrite
	include UN , War
end

cntry = Country_class_final.new

# Finally a menudriven application 
while true
	puts " \n\n",'COUNTRIES DATA ','__________________________________','1. Add new acountry data','2. Read all data','3. Get data of specific country','4. Check whether the country is eligible for Loan from IMF','5. Check whether the country can become Security Council member'
	puts '6. Check whether the country can win the war','7. Exit','__________________________________'
	opt = gets.chop.to_i
	if (opt>6)
		return
	end

	case opt
	when 1
		cntry.addNew
	when 2
		cntry.readData
	when 3	
		cntry.getSpecificCountry
	when 4
		cntry.canGetLoanFromIMF?
	when 5
		cntry.canBecomeSecurityCouncilMember?
	when 6
		cntry.canWinWar?
	end
end