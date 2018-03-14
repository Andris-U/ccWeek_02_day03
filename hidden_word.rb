
class HiddenWord
	attr_accessor :word, :guessed_letters, :wrong_attempts

	def initialize word
		@word = word
		@guessed_letters = [" "]
		@wrong_attempts = []
	end

	def display
		display_array = []
		for letter in @word.split('')
			if @guessed_letters.include? letter
				display_array << letter
			else
				display_array << '*'
			end
		end
		puts display_array.join('')
		return display_array.join('')
	end

	def check_letter letter
		if @word.split('').include? letter
			@guessed_letters << letter
			return true
		elsif (letter =~ /[a-zA-Z]/) == 0
			@wrong_attempts << letter
			return false
		else
			puts "Please select only one letter. No numbers or symbols allowed."
			return nil
		end
	end


end
