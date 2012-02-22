require 'turtle'

describe Turtle do
  # FD x: move forward by x units
  # RT x: change the turtle's current orientation by x degrees clockwise
  # LT x: change the turtle's current orientation by x degrees counterclockwise
  # BK x: move backwards by x units, keeping its current orientation
  # REPEAT x [...]: repeat the movements defined within the square brackets x times.
  #
  # The turtle is initially placed in the center of the grid and is facing upwards:
  #
  #     61
  #
  #     RT 135
  #     FD 5
  #     REPEAT 2 [ RT 90 FD 15 ]
  #     RT 90
  #     FD 5
  #     RT 45
  #     FD 20

  # turtle.fd
  # turtle.bk
  # turtle.repeat 2 do; end;

  let(:turtle) { Turtle.new(11) }

  it 'can be initialized with a grid size' do
    turtle.size.should == 11
  end

  it "defaults it's position to the center of the grid" do
    [Turtle.new(11), Turtle.new(12)].each do |turtle|
      turtle.position.should == [6, 6]
    end
  end

  it "defaults it's direction to zero degrees (up)" do
    turtle.direction.should == 0
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
      turtle.position.should == [x - 2, y + 2]
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
      x.should < turtle.size
      y.should < turtle.size
    end

    it 'stops when it reaches the bottom of the canvas' do
      turtle.rt(180)
      turtle.fd(100)
      x, y = turtle.position
      x.should >= 0
      y.should >= 0
    end

    it 'stops when it reaches the left of the canvas' do
      turtle.rt(90)
      turtle.fd(100)
      x, y = turtle.position
      x.should < turtle.size
      y.should < turtle.size
    end

    it 'stops when it reaches the left of the canvas' do
      turtle.rt(270)
      turtle.fd(100)
      x, y = turtle.position
      x.should >= 0
      y.should >= 0
    end
  end
end
