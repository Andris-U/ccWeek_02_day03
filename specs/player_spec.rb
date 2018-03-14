require('minitest/autorun')
require('minitest/rg')
require_relative('../player')

class HiddenWord_test < Minitest::Test 

	def setup
		@player = Player.new 'test'
	end


end