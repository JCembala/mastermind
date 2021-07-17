require_relative 'board'

class Game
  ROUNDS_NUMBER = 3

  def initialize(board)
    @board = board
    @code = []
    @player_guess = ''
  end

  def play
    game_setup
    ROUNDS_NUMBER.times do |turn|
      ask_player_for_input(turn)
      @player_guess = gets.chomp
      @board.add_code(@player_guess)

      break if game_over?

      @board.print_board
    end

    game_over? ? print_code_breaker_win_message : print_code_creator_win_message
  end

  private

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

  def print_game_instruction
    puts
    puts 'Welcome to Mastermind!'
    puts 'The game is all about breaking 4 digit code'
    puts 'The code is 4 digit from 1 to 6 which can repeat up to 4 times in one code'
    puts 'Code examples: 1111 2233 1234 6421 6666'
    puts 'You will have to guess code in 12 rounds or less to win'
    puts 'After each round you will get some clues'
    puts 'X - means you guessed 1 digit on right place'
    puts 'O - means you guessed 1 digit on wrong place'
    puts
  end

  def game_setup
    generate_code
    print @code
    print_game_instruction
  end
end
