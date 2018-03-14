
class Game
	attr_accessor :player, :hidden_word

	def initialize player, hidden_word
		@player = player
		@hidden_word = hidden_word
	end

	def is_game_lost?
		if @player.lives === 0
			return true
		end
		return false
	end

	def is_game_won?
		if (@hidden_word.word.split('') - @hidden_word.guessed_letters).empty?
			return true
		end
		return false
	end
end
