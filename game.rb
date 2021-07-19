# frozen_string_literal: true

require_relative 'game_input'
require_relative 'rules'

# This class plays games of Mastermind
class Game
  include Rules

  def initialize
    @player_interraction = GameInput.new
  end

  def play
    @player_interraction.player_name_input
    show_rules
    gameloop
  end

  def gameloop
    # Asks what type of game player wants
    # Then plays that type of game
    # Then asks if player wants to do it again
  end

  def guesser_gameplay
    # Do things
  end

  def creator_gameplay
    # Do things
  end
end
