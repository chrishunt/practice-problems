require 'turtle'

describe Turtle do
  let(:turtle) { Turtle.new(11) }

  it 'can be initialized with a canvas size' do
    turtle.size.should == 11
  end

  it 'starts with a single marked pixel on the canvas' do
    count = 0
    turtle.canvas.each do |column|
      column.each do |pixel|
        count += 1 if pixel == true
      end
    end
    count.should == 1
  end

  it "defaults it's position to the center of the canvas" do
    [Turtle.new(11), Turtle.new(12)].each do |turtle|
      turtle.position.should == [5, 5]
    end
  end

  it "defaults it's direction to zero degrees (up)" do
    turtle.direction.should == 0
  end

  describe '#draw' do
    it 'draws the image on the canvas' do
      turtle = Turtle.new(5)
      turtle.draw <<-STEPS
          RT 90
          FD 1
          REPEAT 2 [ RT 45 ]
          FD 2
          REPEAT 2 [ LT 45 ]
          FD 1
          RT 180
          FD 2
      STEPS
      turtle.canvas.should == [
        [false, false, false, false, false],
        [false, false, false, false, false],
        [true , false, true , false, false],
        [true , true , true , false, false],
        [true , false, false, false, false]]
    end
  end

  describe '#rt' do
    it 'can rotate 45 degrees to the right' do
      turtle.rt(45)
      turtle.direction.should == 45
    end

    it 'can rotate 360 degrees to the right' do
      turtle.rt(360)
      turtle.direction.should == 0
    end

    it 'can rotate 495 degrees to the right' do
      turtle.rt(495)
      turtle.direction.should == 135
    end

    it 'can rotate 810 degrees to the right' do
      turtle.rt(810)
      turtle.direction.should == 90
    end

    it 'handles multiple rotations' do
      turtle.rt(90)
      turtle.rt(45)
      turtle.direction.should == 135
    end
  end

  describe '#lt' do
    it 'can rotate 45 degrees to the left' do
      turtle.lt(45)
      turtle.direction.should == 315
    end

    it 'can rotate 360 degrees to the left' do
      turtle.lt(360)
      turtle.direction.should == 0
    end

    it 'can rotate 495 degrees to the left' do
      turtle.lt(495)
      turtle.direction.should == 225
    end

    it 'can rotate 810 degrees to the left' do
      turtle.lt(810)
      turtle.direction.should == 270
    end

    it 'handles multiple rotations' do
      turtle.lt(90)
      turtle.lt(45)
      turtle.direction.should == 225
    end
  end

  describe '#rotate' do
    it 'can rotate 45 degrees' do
      turtle.send(:rotate, 45)
      turtle.direction.should == 45
    end

    it 'can rotate 90 degrees' do
      turtle.send(:rotate, 90)
      turtle.direction.should == 90
    end

    it 'can rotate 360 degrees' do
      turtle.send(:rotate, 360)
      turtle.direction.should == 0
    end

    it 'can rotate 495 degrees' do
      turtle.send(:rotate, 495)
      turtle.direction.should == 135
    end

    it 'can rotate 810 degrees' do
      turtle.send(:rotate, 810)
      turtle.direction.should == 90
    end

    it 'can rotate -45 degrees' do
      turtle.send(:rotate, -45)
      turtle.direction.should == 315
    end

    it 'can rotate -90 degrees' do
      turtle.send(:rotate, -90)
      turtle.direction.should == 270
    end

    it 'can rotate -360 degrees' do
      turtle.send(:rotate, -360)
      turtle.direction.should == 0
    end

    it 'can rotate -495 degrees' do
      turtle.send(:rotate, -495)
      turtle.direction.should == 225
    end

    it 'can rotate -810 degrees' do
      turtle.send(:rotate, -810)
      turtle.direction.should == 270
    end

    it 'handles multiple rotations' do
      turtle.send(:rotate, 90)
      turtle.send(:rotate, 45)
      turtle.direction.should == 135
    end
  end

  describe '#fd' do
    it 'draws on traveled areas of the canvas' do
      turtle = Turtle.new(5)
      turtle.rt(90)
      turtle.fd(1)
      turtle.rt(90)
      turtle.fd(2)
      turtle.lt(90)
      turtle.fd(1)
      turtle.rt(180)
      turtle.fd(2)
      turtle.canvas.should == [
        [false, false, false, false, false],
        [false, false, false, false, false],
        [true , false, true , false, false],
        [true , true , true , false, false],
        [true , false, false, false, false]]
    end

    it 'moves the turtle forward when facing 0 degress' do
      x, y = turtle.position
      turtle.fd(2)
      turtle.position.should == [x, y + 2]
    end

    it 'moves the turtle forward when facing 45 degress' do
      x, y = turtle.position
      turtle.rt(45)
      turtle.fd(2)
      turtle.position.should == [x + 2, y + 2]
    end

    it 'moves the turtle forward when facing 90 degress' do
      x, y = turtle.position
      turtle.rt(90)
      turtle.fd(2)
      turtle.position.should == [x + 2, y]
    end

    it 'moves the turtle forward when facing 135 degress' do
      x, y = turtle.position
      turtle.rt(135)
      turtle.fd(2)
      turtle.position.should == [x + 2, y - 2]
    end

    it 'moves the turtle forward when facing 180 degress' do
      x, y = turtle.position
      turtle.rt(180)
      turtle.fd(2)
      turtle.position.should == [x, y - 2]
    end

    it 'moves the turtle forward when facing 225 degress' do
      x, y = turtle.position
      turtle.rt(225)
      turtle.fd(2)
      turtle.position.should == [x - 2, y - 2]
    end

    it 'moves the turtle forward when facing 270 degress' do
      x, y = turtle.position
      turtle.rt(270)
      turtle.fd(2)
      turtle.position.should == [x - 2, y]
    end

    it 'moves the turtle forward when facing 315 degress' do
      x, y = turtle.position
      turtle.rt(315)
      turtle.fd(2)
      turtle.position.should == [x - 2, y + 2]
    end

    it 'stops when it reaches the top of the canvas' do
      turtle.fd(100)
      x, y = turtle.position
      y.should < turtle.size
    end

    it 'stops when it reaches the bottom of the canvas' do
      turtle.rt(180)
      turtle.fd(100)
      x, y = turtle.position
      y.should >= 0
    end

    it 'stops when it reaches the right of the canvas' do
      turtle.rt(90)
      turtle.fd(100)
      x, y = turtle.position
      x.should < turtle.size
    end

    it 'stops when it reaches the left of the canvas' do
      turtle.rt(270)
      turtle.fd(100)
      x, y = turtle.position
      x.should >= 0
    end
  end

  describe '#bk' do
    it 'draws on traveled areas of the canvas' do
      turtle = Turtle.new(5)
      turtle.lt(90)
      turtle.bk(1)
      turtle.rt(90)
      turtle.bk(2)
      turtle.lt(90)
      turtle.bk(1)
      turtle.rt(180)
      turtle.bk(2)
      turtle.canvas.should == [
        [false, false, false, false, false],
        [false, false, false, false, false],
        [true , false, true , false, false],
        [true , true , true , false, false],
        [true , false, false, false, false]]
    end
    it 'moves the turtle forward when facing 0 degress' do
      x, y = turtle.position
      turtle.bk(2)
      turtle.position.should == [x, y - 2]
    end

    it 'moves the turtle forward when facing 45 degress' do
      x, y = turtle.position
      turtle.rt(45)
      turtle.bk(2)
      turtle.position.should == [x - 2, y - 2]
    end

    it 'moves the turtle forward when facing 90 degress' do
      x, y = turtle.position
      turtle.rt(90)
      turtle.bk(2)
      turtle.position.should == [x - 2, y]
    end

    it 'moves the turtle forward when facing 135 degress' do
      x, y = turtle.position
      turtle.rt(135)
      turtle.bk(2)
      turtle.position.should == [x - 2, y + 2]
    end

    it 'moves the turtle forward when facing 180 degress' do
      x, y = turtle.position
      turtle.rt(180)
      turtle.bk(2)
      turtle.position.should == [x, y + 2]
    end

    it 'moves the turtle forward when facing 225 degress' do
      x, y = turtle.position
      turtle.rt(225)
      turtle.bk(2)
      turtle.position.should == [x + 2, y + 2]
    end

    it 'moves the turtle forward when facing 270 degress' do
      x, y = turtle.position
      turtle.rt(270)
      turtle.bk(2)
      turtle.position.should == [x + 2, y]
    end

    it 'moves the turtle forward when facing 315 degress' do
      x, y = turtle.position
      turtle.rt(315)
      turtle.bk(2)
      turtle.position.should == [x + 2, y - 2]
    end

    it 'stops when it reaches the bottom of the canvas' do
      turtle.bk(100)
      x, y = turtle.position
      y.should >= 0
    end

    it 'stops when it reaches the top of the canvas' do
      turtle.rt(180)
      turtle.bk(100)
      x, y = turtle.position
      y.should < turtle.size
    end

    it 'stops when it reaches the left of the canvas' do
      turtle.rt(90)
      turtle.bk(100)
      x, y = turtle.position
      x.should >= 0
    end

    it 'stops when it reaches the right of the canvas' do
      turtle.rt(270)
      turtle.bk(100)
      x, y = turtle.position
      x.should < turtle.size
    end
  end

  describe '#repeat' do
    it 'executes the provided block the correct amount of times' do
      count = 0
      turtle.repeat(3) { count += 1 }
      count.should == 3
    end

    it 'handles rotate commands' do
      turtle.repeat(2) { turtle.rt(45) }
      turtle.direction.should == 90
    end
  end

  describe '#execute' do
    it 'works with lowercase commands' do
      turtle.execute('rt 90')
      turtle.direction.should == 90
    end

    it 'works correctly for right turns' do
      turtle.execute('RT 90')
      turtle.direction.should == 90
    end

    it 'works correctly for left turns' do
      turtle.execute('LT 90')
      turtle.direction.should == 270
    end

    it 'works correctly for taking forward steps' do
      x, y = turtle.position
      turtle.execute('FD 3')
      turtle.position.should == [x, y + 3]
    end

    it 'works correctly for taking backward steps' do
      x, y = turtle.position
      turtle.execute('BK 2')
      turtle.position.should == [x, y - 2]
    end

    it 'works correctly for single item repeat blocks' do
      turtle.execute('REPEAT 2 [ RT 45 ]')
      turtle.direction.should == 90
    end
  end
end
