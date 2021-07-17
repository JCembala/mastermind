class Board

  attr_accessor :code

  def initialize
    @board = []
    @code = ''
  end

  def print_board
    return if @board.empty?

    puts '-----------------'
    @board.each do |code|
      code.split('').each do |digit|
        print "#{digit} "
      end
      print_clues
      puts
    end
    puts '-----------------'
  end

  def add_guess(guess)
    @board.push(guess)
  private

  def print_clues(clues_array = '| X X X X')
    print clues_array
  end
end
