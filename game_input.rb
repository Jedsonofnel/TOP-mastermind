# frozen_string_literal: true

# functions relating to getting input for the game
module GameInput
  # Asks for and gets the name of the human player
  def player_name_input
    print "What is your name?\n> "
    gets.chomp
  end
end
