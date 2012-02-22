class Turtle
  attr_reader :size, :position, :direction, :canvas

  def initialize(size)
    center = (size - size/2) - 1
    @size = size
    @direction = 0
    @canvas = new_canvas
    update_position(center, center)
  end

  def rt(degrees)
    rotate(degrees)
  end

  def lt(degrees)
    rotate(-degrees)
  end

  def fd(steps)
    walk(steps)
  end

  def bk(steps)
    walk(-steps)
  end

  def draw(commands)
    commands.lines.each { |command| execute(command) }
  end

  def to_s
    s = ''
    oriented_canvas.each do |column|
      column.each do |pixel|
        char = pixel ? 'X' : '.'
        s += "#{char} "
      end
      s = s.strip + "\n"
    end
    s.strip
  end

  private

  def new_canvas
    Array.new(@size) { Array.new(@size) {false} }
  end

  def update_position(x, y)
    @position = place_in_canvas_bounds(x, y)
    update_canvas
  end

  def rotate(degrees)
    @direction += degrees
    @direction += 360 while @direction < 0
    @direction -= 360 while @direction >= 360
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

  def walk(steps)
    x, y  = @position
    step  = steps < 0 ? -1 : 1
    steps = steps < 0 ? -steps : steps

    1.upto(steps) do
      x, y = case direction
        when 0;   [x,        y + step]
        when 45;  [x + step, y + step]
        when 90;  [x + step, y       ]
        when 135; [x + step, y - step]
        when 180; [x,        y - step]
        when 225; [x - step, y - step]
        when 270; [x - step, y       ]
        when 315; [x - step, y + step]
      end
      update_position(x, y)
    end
  end

  def update_canvas
    x, y = @position
    @canvas[x][y] = true
  end

  def place_in_canvas_bounds(x, y)
    x = 0 if x < 0
    y = 0 if y < 0
    x = @size - 1 if x >= @size
    y = @size - 1 if y >= @size
    [x, y]
  end

  def oriented_canvas
    oriented = new_canvas
    @canvas.each_with_index do |column, i|
      column.each_with_index do |pixel, j|
        oriented[@size-1-j][i] = pixel
      end
    end
    oriented
  end
end
