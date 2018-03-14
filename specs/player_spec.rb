require('minitest/autorun')
require('minitest/rg')
require_relative('../player')
require_relative('../hidden_word')

class HiddenWord_test < Minitest::Test 

	def setup
		@hidden_word = HiddenWord.new('testing')
		@player = Player.new 'test'
	end

	def test_subtract_life
		guess = @hidden_word.check_letter('x')
		@player.subtract_life(guess)
		assert_equal(2, @player.lives)
	end

	def test_subtract_life__no_subtraction
		guess = @hidden_word.check_letter('s')
		@player.subtract_life(guess)
		assert_equal(3, @player.lives)
	end

end