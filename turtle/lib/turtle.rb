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

  def fd(steps)
    step_in_direction(steps)
    place_in_bounds
  end

  private

  def rotate(degrees)
    @direction += degrees
    @direction += 360 while @direction < 0
    @direction -= 360 while @direction >= 360
  end

  def step_in_direction(steps)
    x, y = @position
    @position = case direction
    when 0
      [x, y + steps]
    when 45
      [x + steps, y + steps]
    when 90
      [x + steps, y]
    when 135
      [x + steps, y - steps]
    when 180
      [x, y - steps]
    when 225
      [x - steps, y + steps]
    when 270
      [x - steps, y]
    when 315
      [x - steps, y + steps]
    end
  end

  def place_in_bounds
    x, y = @position
    y = @size - 1 if y > @size
    y = 0 if y < 0
    x = @size - 1 if x > @size
    x = 0 if x < 0
    @position = [x, y]
  end

end
