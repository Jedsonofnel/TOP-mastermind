# frozen_string_literal: true

# functions relating to getting input for the game
module GameInput
  # Asks for and gets the name of the human player
  def player_name_input
    print "\nWhat is your name?\n> "
    gets.chomp
  end

  # Asks for and gets whether the player wants to be the guesser or coder
  def gameplay_type_input
    print "\nWould you like to be the code creator or code guesser? (g/c)\n> "

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

  # Asks whether the player wants to play again
  # Returns true or false accordingly
  def play_again?
    print "\nWould you like to play again? (y/n)\n> "

    case gets.chomp.downcase
    when 'y'
      true
    when 'n'
      false
    else
      puts 'Invalid input!'
      play_agian?
    end
  end

  def guess_input(guess_number)
    print "\nGuess ##{guess_number}:\n> "
    input = gets.chomp
    if input.match?(/\b\d{4}\b/)
      input
    else
      puts 'Invalid input! Guesses need to be a four digit integer.'
      guess_input(guess_number)
    end
  end
end
