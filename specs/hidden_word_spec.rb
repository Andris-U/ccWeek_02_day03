require('minitest/autorun')
require('minitest/rg')
require_relative('../hidden_word')

class HiddenWord_test < Minitest::Test 

	def setup
		@hidden_word = HiddenWord.new('testing')
	end

	def test_initial_word
		assert_equal('testing', @hidden_word.word)
	end

	def test_display
		@hidden_word.guessed_letters.concat(['e','t'])
		assert_equal('te*t***', @hidden_word.display)
	end

	def test_check_letter
		assert_equal(true, @hidden_word.check_letter('e'))
		assert_equal(false, @hidden_word.check_letter('k'))
	end

	def test_right_guess_saves_letter
		@hidden_word.check_letter('s')
		assert_equal(1, @hidden_word.guessed_letters.count)
	end

end