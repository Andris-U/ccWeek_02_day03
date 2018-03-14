require_relative('hidden_word')
require_relative('player')
require_relative('game')
require_relative('game_logic')

system('clear')
puts "Welcome to the game! To start press enter"
gets.chomp
system('clear')

game = start_game

while !game.is_game_lost? && !game.is_game_won?
	display_screen game
	player_turn game
	check_conditions game
end
