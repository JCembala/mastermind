class Board

  def initialize
    @board = []
  end

  def print_board
    return if @board.empty?

    puts '--------'
    @board.each do |row|
      row.print_row
      puts
    end
    puts '--------'
  end

  def add_guess(row)
    @board.push(row)
  end
end