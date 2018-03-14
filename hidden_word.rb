
class HiddenWord
	attr_accessor :name, :guessed_letters

	def initialize name
		@name = name
		@guessed_letters = []
	end

	def display
		display_array = []
		for letter in @name.split('')
			if @guessed_letters.include? letter 
				display_array << letter
			else
				display_array << '*'
			end
		end
		return display_array.join('')
	end
end