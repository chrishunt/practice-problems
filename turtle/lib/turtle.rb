class Turtle
  attr_reader :size, :position, :direction

  def initialize(size)
    center = size - size/2
    @position = [center, center]
    @direction = 0
    @size = size
  end

  def rt(degrees)
    rotate(degrees)
  end

  def lt(degrees)
    rotate(-degrees)
  end

  private

  def rotate(degrees)
    @direction += degrees
    @direction += 360 while @direction < 0
    @direction -= 360 while @direction >= 360
  end
end
