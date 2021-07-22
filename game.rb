# frozen_string_literal: true

require_relative 'game_input'
require_relative 'rules'
require_relative 'computer_player'

# This class plays games of Mastermind
class Game
  include Rules
  include GameInput

  attr_reader :scoreboard, :player_name

  def initialize
    @scoreboard = Hash.new(0)
    @computer_player = ComputerPlayer.new(self)
  end

  def play
    welcome
    @player_name = player_name_input
    gameloop
  end

  def bulls_and_cows(guess, code = @current_code)
    output = Hash.new(0)

    code.split('').each_with_index do |digit, index|
      if guess.split('')[index] == digit
        output['bulls'] += 1
      elsif code.split('').include? guess.split('')[index]
        output['cows'] += 1
      end
    end

    output
  end

  private

  def gameloop
    @current_code = generate_code
    show_rules

    case gameplay_type_input
    when 'code_guesser'
      guesser_gameplay
    when 'code_creator'
      creator_gameplay
    end

    show_scoreboard

    play_again? ? gameloop : goodbye
  end

  def guesser_gameplay
    guess_number = 0
    result = {}

    puts "\n#{@player_name} is now guessing a computer generated code:"

    7.times do
      guess_number += 1
      result = bulls_and_cows(guess_input(guess_number))
      puts "Bulls: #{result['bulls']}\nCows: #{result['cows']}"
      break if correct_code?(result)
    end

    correct_code?(result) ? guess_win_message(guess_number) : guess_lose_message
  end

  def creator_gameplay
    @current_code = code_input
    @computer_player.solve
    create_win_message
  end

  def welcome
    puts '==================================================='
    puts 'WELCOME TO MY RUBY IMPLEMENTATION OF BULLS AND COWS'
    puts '==================================================='
    puts '(a variant of Mastermind)'
  end

  def goodbye
    puts "\nGoodbye #{@player_name}!"
  end

  def guess_win_message(guess_number)
    puts "\nCongratulations #{@player_name} - you won in #{guess_number} turns!"
    @scoreboard[@player_name] += 1
  end

  def guess_lose_message
    puts "\n#{@player_name}, you were unable to guess the code!  It was #{@current_code}."
    @scoreboard['Computer'] += 1
  end

  def create_win_message
    puts "\n#{@player_name}, you have bamboozled the computer with your code!"
    puts 'Therefore you win!'
    @scoreboard[@player_name] += 1
  end

  def create_lose_message
    puts "\n#{@player_name}, the computer successfully guessed your code!"
    puts 'Therefore you lose!'
    @scoreboard['Computer'] += 1
  end

  def show_scoreboard
    puts "\nScores on the doors:"
    puts "#{@player_name}: #{@scoreboard[@player_name]}"
    puts "Computer: #{@scoreboard['Computer']}"
  end

  def generate_code
    code = ''
    characters = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].shuffle
    4.times { code += characters.pop.to_s }
    code
  end

  def correct_code?(bulls_and_cows_hash)
    bulls_and_cows_hash['bulls'] == 4
  end
end
