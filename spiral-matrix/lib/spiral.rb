# Print a 2D array matrix in spiral order

class Spiral
  attr_accessor :array

  def initialize(array = [])
    @array = array
  end

  def spiral_array
    ret = []
    @a = @array
    while (!@a.nil? && @a.size > 0)
      [:f_row, :r_col, :b_row, :l_col].each do |f|
        tmp = method(f).call
        tmp ||= []
        for c in tmp do; ret << c; end
      end
    end
    ret
  end

  private

  def f_row
    ret = []
    if @a.first.class == Array
      ret = @a.first
      @a = @a[1..@a.size]
    else
      ret = @a
      @a = []
    end
    ret
  end

  def r_col
    ret = []
    if @a.first.class == Array
      @a.each_with_index do |r, i|
        ret << r.last
        @a[i] = @a[i].size > 1 ? @a[i][0..@a[i].size-2] : []
      end
    else
      ret = @a.last
      @a = @a[0..@a.size-2]
    end
    ret
  end

  def b_row
    ret = []
    if @a.first.class == Array
      ret = @a.last.reverse
      @a = @a.size > 1 ? @a[0..@a.size-2] : []
    else
      ret = @a.reverse
      @a = []
    end
    ret
  end

  def l_col
    ret = []
    if @a.first.class == Array
      @a.reverse.each_with_index do |r, i|
        ret << r.first
        @a[@a.size-1-i] = @a[@a.size-1-i][1..@a[@a.size-1-i].size]
      end
    else
      ret = @a.first
      @a = @a[1..@a.size]
    end
    ret
  end
end
