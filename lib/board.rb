class Board
  attr_accessor :code

  def initialize
    @codes = []
    @clues = []
    @code = []
    @code_clone = []
    @guess_copy = []
  end

  def print_board
    return if @codes.empty?

    process_clues
    puts '-----------------'
    print_line
    puts '-----------------'
  end

  def add_guess(guess)
    @codes.push(guess.clone)
    @guess_copy = guess.clone
  end

  private

  def print_line
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
    remove_left_digits
    @clues.push(@guess_copy)
  end

  def exact_match
    @code_clone = @code.clone
    @guess_copy.each_with_index do |item, index|
      next unless item.to_s == @code_clone[index].to_s

      @guess_copy[index] = 'X'
      @code_clone[index] = '?'
    end
  end

  def right_digit_match
    @guess_copy.each_with_index do |item, index|
      next unless item.to_s != 'X' && @code_clone.to_s.include?(item.to_s)

      @guess_copy[index] = 'O'
      @code_clone[index] = '?'
    end
  end

  def remove_left_digits
    @guess_copy.delete_if { |item| item.to_s != 'X' && item.to_s != 'O' }
  end
end
