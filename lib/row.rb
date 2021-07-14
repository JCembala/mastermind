class Row

  def initialize(num_array)
    @nums = num_array
  end

  def print_row
    @nums.each do |num|
      print "#{num} "
    end
  end
end
