require_relative 'board'

class Game
  ROUNDS_NUMBER = 3

  def initialize(board)
    @board = board
    @code = []
    @player_guess = 0
  end

  def play
    generate_code
    print @code
    ROUNDS_NUMBER.times do |turn|
      ask_player_for_input(turn)
      @player_guess = gets.chomp

      break if game_over?
    end

    game_over? ? print_code_breaker_win_message : print_code_creator_win_message
  end

  def ask_player_for_input(turn)
    puts "Round #{turn + 1} what is your guess?"
  end

  def generate_code
    @code = []
    4.times do
      @code.push(rand(1..6))
    end
  end

  def game_over?
    @player_guess == @code.join
  end

  def print_code_breaker_win_message
    puts 'You got it right. Code breaker you won!'
  end

  def print_code_creator_win_message
    puts 'That was last try. Code creator won!'
  end
end
