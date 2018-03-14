require_relative('game')

def start_game
  puts "Please enter your name: "
  player_name = gets.chomp

  player = Player.new(player_name)
  system('clear')

  puts "Cool! Now pick a word. It can only contain letters."
  chosen_word = gets.chomp.downcase

  word = HiddenWord.new ( chosen_word )

  system('clear')
  return Game.new player, word
end

def display_screen game
  puts snowman = %q(
                      .------,
      .\/.          |______|
    _\_}{_/_       _|_Ll___|_
     / }{ \       [__________]          .\/.
      '/\'        /          \        _\_\/_/_
                 ()  o  o    ()        / /\ \
                  \ ~~~   .  /          '/\'
             _\/   \ '...'  /    \/_
              \\   {`------'}    //
               \\  /`---/',`\\  //
                \/'  o  | |\ \`//
                /'      | | \/ /\
   __,. -- ~~ ~|    o   `\|      |~ ~~ -- . __
               |                 |
          jgs  \    o            /
                `._           _.'
                   ^~- . -  ~^
  )
  game.hidden_word.display
  puts "You have tried: #{game.hidden_word.wrong_attempts.uniq}"
  puts "You have #{game.player.lives.to_s} left!"
end

def player_turn game
  puts "Please pick a letter"

	letter = gets.chomp
	result = game.hidden_word.check_letter(letter)
  game.player.subtract_life(result)
  result ? game.player.success = true : game.player.success = false
end

def check_conditions game
  if game.is_game_lost?
    puts "Game over!"
    puts "Press ENTER to continue."
    gets.chomp
    return nil
  elsif game.is_game_won?
    puts "Congratulations, #{game.player.name}! You won!"
    puts "Press ENTER to continue."
    gets.chomp
    return nil
  end

  if game.player.success == false
    puts "Ouch! That was the wrong letter."
  elsif game.player.success == true
    puts "Nice! '#{game.hidden_word.guessed_letters.last}' is part of the word!"
  end
  puts "Press ENTER to continue."
  gets.chomp
  system('clear')
end
