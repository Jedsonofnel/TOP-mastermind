# frozen_string_literal: true

# Module pertaining to the rules of Bulls and Cows
module Rules
  RULES = <<~HEREDOC
    ==== Rules of Bulls and Cows: ====
    (A Mastermind Variant)

    A player (the code creator) creates a secret 4 digit numerical code
    and the other player (the code guesser) needs to guess it in less
    than 7 guesses.

    When the guesser gives a guess the creator will respond with the
    number of bulls and cows in the guess.  A bull is a digit that is
    in the right space and a cow is a correct digit.

    For example, for the secret code: "6213", a guess of "1234" would
    get one bull because "2" is in the right place, and two cows,
    because "1" and "3" are correct digits just not in the right place.

    The guesser has 7 guesses to get the right code.
    ==================================
  HEREDOC

  def show_rules
    print "Would you like to see the rules? (y/n)\n> "

    case gets.chomp.downcase
    when 'y'
      puts RULES
    when 'n'
      # Do nothing
    else
      puts 'invalid input!'
      show_rules
    end
  end
end
