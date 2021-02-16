require 'io/console'
require 'highline'

class Hangman
	attr_accessor :player1, :player2 , :word, :category
	
	def enterWord
		puts "\n Enter word:"
		# @word = gets.chop.to_s
		# @word = STDIN.noecho(&:gets).chomp
		cli = HighLine.new
		@word = cli.ask('word:') { |q| q.echo = 'x' }
		puts "Enter category: "
		@category = gets.chop.to_s
	end

	def guessWord
		lifes = 8
		if (!word)
			puts "Ask #{player1} to enter word "
			return
		end
		n = word.length
		dummy = ""
		n.times do
			dummy.concat('-')
		end
		missing = []
		i = 1

		while true do
			puts "\n ======================== "
			puts "Word  : #{dummy}"
			puts "Category : #{category}"
			puts "Missing : #{missing}"
			print "Enter guess no #{i} :"
			i = i + 1

			c = gets.chop.to_s
			puts "\n ======================== "
			dummydummy = dummy.clone
			# puts 'IDs:' , dummydummy.object_id , dummy.object_id
			changedDummy = searchCharInWord(c, dummydummy)

			if(changedDummy == dummy)
				lifes = lifes - 1
				if (lifes == 0)
					puts "You lost the game, play again"
					return
				end
				puts "Wrong guess. #{lifes} lifes remaining, try again"
				missing.push(c)
			else
				# lifes = lifes + 1
				dummy = changedDummy
				if ( dummy == word )
					puts "Yeah ! you did it. Congratulation ! you won the game"
					return
				else
					puts "Great ! Your guessed it right. Keep rocking","#{lifes} lifes remaining"
				end
			end
		end
		puts "Your lifes finished. You lost. Play again"

	end

	def searchCharInWord(c, dummydummy)
		i = 0 
		n = dummydummy.length
		n.times do 
			a = word[i]
			if ( a.upcase == c || a.downcase == c )
				dummydummy[i] = a
			end
			i = i + 1
		end
		return dummydummy
	end
end

# h = Hangman.new
# 		h.enterWord
# 		h.guessWord

while true
	
	puts " *** HANGMAN  **** "
	puts "1. Play "
	puts "2. Exit"
	puts "Option: "
	opt = gets.chop.to_i 
	h = Hangman.new
	if(opt > 1)
		return

	case opt
	when 1
		
		h.enterWord
		h.guessWord
	end
end
end