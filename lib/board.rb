class Board

  def initialize
    @board = []
  end

  def print_board
    return if @board.empty?

    puts '-----------------'
    @board.each do |code|
      code.split('').each do |digit|
        print "#{digit} "
      end
      print_indications
      puts
    end
    puts '-----------------'
  end

  def add_code(code)
    @board.push(code)
  end

  def print_indications(indications_array = '| X X X X')
    print indications_array
  end
end
