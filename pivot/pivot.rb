# Given an array of unsorted integers, find the pivot point n in the array where
# the sum of input(0..n) = sum of input (n+1..input.size). Values in the input
# array may be positive or negative.
#
# For example, given the input:
#
#   [1,2,3,0,4,2]
#
# The pivot point would be 3, the index of '0' because:
#
#   1 + 2 + 3 = 4 + 2

class PivotFinder
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def find_pivot
    left = left_sum
    right = right_sum
    (0..@array.size).each do |i|
      return i if left[i] == right[i]
    end
    return nil
  end

  def left_sum
    sum("left")
  end

  def right_sum
    sum("right")
  end

  private

  def sum(direction = nil)
    sums = []
    array = direction == "right" ? @array.reverse : @array
    array.each_with_index do |v, i|
      if sums.size == 0
        sums[i] = v
      else
        sums[i] = sums[i-1] + v
      end
    end
    return direction == "right" ? sums.reverse : sums
  end
end

# Begin code test
array = [1,7,-2,-10,4,3,-7]
pf = PivotFinder.new array

puts "Input: #{array}"
puts "Left:  #{pf.left_sum}"
puts "Right: #{pf.right_sum}"
puts "Pivot: #{pf.find_pivot}"

