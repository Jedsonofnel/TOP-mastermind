# frozen_string_literal: true

require_relative 'game_input'
require_relative 'rules'

# This class plays games of Mastermind
class Game
  include Rules
  include GameInput

  attr_reader :scoreboard

  def initialize
    @scoreboard = Hash.new(0)
  end

  def play
    @player_name = player_name_input
    gameloop
  end

  private

  def gameloop
    show_rules

    case gameplay_type_input
    when 'code_guesser'
      guesser_gameplay
    when 'code_creator'
      creator_gameplay
    end

    play_again? ? gameloop : goodbye
  end

  def guesser_gameplay
    # Do things
  end

  def creator_gameplay
    # Do things
  end

  def bulls_and_cows(code, guess)
    # Return Hash of ("bulls" => x, "cows" => y)
    output = Hash.new(0)

    code.split('').each_with_index do |digit, index|
      if guess.split('')[index] == digit
        output['bulls'] += 1
      elsif guess.split('').include? digit
        output['cows'] += 1
      end
    end

    output
  end

  def goodbye
    puts "Goodbye #{@player_name}!"
  end
end
