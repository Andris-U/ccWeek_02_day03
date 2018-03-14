require('minitest/autorun')
require('minitest/rg')
require_relative('../hidden_word')

class HiddenWord_test < Minitest::Test 

	def setup
		@hidden_word = HiddenWord.new('testing')
	end

	def test_initial_word
		assert_equal('testing', @hidden_word.name)
	end

	def test_display
		@hidden_word.guessed_letters.concat(['e','t'])
		assert_equal('te*t***', @hidden_word.display)
	end
end