# Print a 2D array matrix in spiral order

class Spiral
  attr_accessor :array

  def initialize(array = [])
    @array = array
  end

  def spiral_array
    r = []
    @a = @array
    while !@a.nil? && @a.size > 0
      [:f_row, :r_col, :b_row, :l_col].each do |m|
        tmp = method(m).call
        tmp ||= []
        tmp.each { |o| r << o }
      end
    end

    r
  end

  private

  def f_row
    r = []
    if @a.first.class == Array
      r = @a.first
      @a = @a[1..@a.size]
    else
      r = @a
      @a = []
    end

    r
  end

  def r_col
    r = []
    if @a.first.class == Array
      @a.each_with_index do |o, i|
        r << o.last
        @a[i] = @a[i].size > 1 ? @a[i][0..@a[i].size-2] : []
      end
    else
      r = @a.last
      @a = @a[0..@a.size-2]
    end

    r
  end

  def b_row
    r = []
    if @a.first.class == Array
      r = @a.last.reverse
      @a = @a.size > 1 ? @a[0..@a.size-2] : []
    else
      r = @a.reverse
      @a = []
    end

    r
  end

  def l_col
    r = []
    if @a.first.class == Array
      @a.reverse.each_with_index do |o, i|
        r << o.first
        ri = @a.size-1-i
        @a[ri] = @a[ri][1..@a[ri].size]
      end
    else
      r = @a.first
      @a = @a[1..@a.size]
    end

    r
  end
end
