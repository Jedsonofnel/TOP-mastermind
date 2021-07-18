# frozen_string_literal: true

require_relative 'game_input'
require_relative 'rules'

# This class plays games of mastermind
class Game
  include GameInput
  include Rules

  def play
    player_name = player_name_input
  end
end
