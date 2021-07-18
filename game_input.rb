# frozen_string_literal: true

# functions relating to getting input for the game
class GameInput
  # Asks for and gets the name of the human player
  def player_name_input
    print "What is your name?\n> "
    @player_name = gets.chomp
  end

  # Asks for and gets whether the player wants to be the guesser or coder
  def gameplay_type_input
    print '> '

    case gets.chomp.downcase
    when 'g'
      'code_guesser'
    when 'c'
      'code_creator'
    else
      puts 'Invalid input!'
      gameplay_type_input
    end
  end
end
