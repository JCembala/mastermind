class Board
  attr_accessor :code

  def initialize
    @codes = []
    @clues = []
    @code = []
    @guess_copy = []
  end

  def print_board
    return if @codes.empty?

    process_clues
    puts '-----------------'
    print_codes
    puts '-----------------'
  end

  def add_guess(guess)
    @codes.push(guess.clone)
    @guess_copy = guess.clone
  end

  private

  def print_codes
    @codes.each_with_index do |code, index|
      code.each do |digit|
        print "#{digit} "
      end
      print_clues(index)
    end
  end

  def print_clues(index)
    print '| '
    @clues[index].each do |char|
      print "#{char} "
    end
    puts
  end

  def process_clues
    exact_match
    right_digit_match
    @clues.push(@guess_copy)
  end

  def exact_match
    @guess_copy.each_with_index do |item, index|
      next unless item.to_s == @code[index].to_s

      @guess_copy[index] = 'X'
    end
  end

  def right_digit_match
    @guess_copy.each_with_index do |item, index|
      next unless item.to_s != 'X' && @code.include?(item.to_s)

      @guess_copy[index] = 'O'
    end
  end
end
