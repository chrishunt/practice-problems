class Turtle
  attr_reader :size, :position, :direction, :canvas

  def initialize(size)
    center = size - size/2 - 1
    @position = [center, center]
    @direction = 0
    @size = size
    @canvas = Array.new(@size) { Array.new(@size) {false} }
    draw_pixel
  end

  def rt(degrees)
    rotate(degrees)
  end

  def lt(degrees)
    rotate(-degrees)
  end

  def fd(steps)
    step_in_direction(steps)
  end

  def bk(steps)
    step_in_direction(-steps)
  end

  def repeat(times, &instructions)
    1.upto(times) { instructions.call }
  end

  def execute(command)
    words = command.split(' ')
    if words.size == 2
      method, param = words
      self.send(method.downcase, param.to_i)
    else
      1.upto(words[1].to_i) do
        commands = words[3..words.size-2]
        execute(commands.shift(2).join(' ')) while commands.size > 0
      end
    end
  end

  def draw(commands)
    commands.lines.each { |command| execute(command) }
  end

  def to_s
    s = ''
    translate_canvas.each do |column|
      column.each do |pixel|
        char = pixel ? 'X' : '.'
        s += "#{char} "
      end
      s = s.strip + "\n"
    end
    s.strip
  end

  private

  def rotate(degrees)
    @direction += degrees
    @direction += 360 while @direction < 0
    @direction -= 360 while @direction >= 360
  end

  def step_in_direction(steps)
    increment = steps < 0 ? -1 : 1
    steps = steps < 0 ? -steps : steps

    1.upto(steps) do
      x, y = @position
      @position = case direction
      when 0
        [x, y + increment]
      when 45
        [x + increment, y + increment]
      when 90
        [x + increment, y]
      when 135
        [x + increment, y - increment]
      when 180
        [x, y - increment]
      when 225
        [x - increment, y - increment]
      when 270
        [x - increment, y]
      when 315
        [x - increment, y + increment]
      end

      place_in_bounds
      draw_pixel
    end
  end

  def place_in_bounds
    x, y = @position
    y = @size - 1 if y >= @size
    y = 0 if y < 0
    x = @size - 1 if x >= @size
    x = 0 if x < 0
    @position = [x, y]
  end

  def draw_pixel
    x, y = @position
    @canvas[x][y] = true
  end

  def translate_canvas
    translated = Array.new(@size) { Array.new(@size) { false } }
    @canvas.each_with_index do |column, i|
      column.each_with_index do |pixel, j|
        translated[@size-1-j][i] = pixel
      end
    end
    translated
  end
end
