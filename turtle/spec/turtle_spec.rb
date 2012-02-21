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

  # turtle.rt
  # turtle.lt
  # turtle.fd
  # turtle.bk
  # turtle.repeat 2 do; end;

  it 'can be initialized with a grid size' do
    Turtle.new(11).size.should == 11
  end

  it "defaults it's position to the center of the grid" do
    [Turtle.new(11), Turtle.new(12)].each do |turtle|
      turtle.position.should == [6, 6]
    end
  end

  it "defaults it's direction to zero degrees (up)" do
    Turtle.new(11).direction.should == 0
  end

  describe '#rt' do
    it 'can rotate 45 degrees to the right' do
      turtle = Turtle.new(11)
      turtle.rt(45)
      turtle.direction.should == 45
    end

    it 'can rotate 90 degrees to the right' do
      turtle = Turtle.new(11)
      turtle.rt(90)
      turtle.direction.should == 90
    end

    it 'can rotate 360 degrees to the right' do
      turtle = Turtle.new(11)
      turtle.rt(360)
      turtle.direction.should == 0
    end

    it 'can rotate 495 degrees to the right' do
      turtle = Turtle.new(11)
      turtle.rt(495)
      turtle.direction.should == 135
    end

    it 'can rotate 810 degrees to the right' do
      turtle = Turtle.new(11)
      turtle.rt(810)
      turtle.direction.should == 90
    end
  end
end
