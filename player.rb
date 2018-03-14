
class Player
	attr_accessor :name, :lives, :success

	def initialize name
		@name = name
		@lives = 3
		@success = true
	end

	def subtract_life guess_result
		if guess_result == false
			@lives -= 1
		elsif guess_result == true
			return false
		end
	end

end
