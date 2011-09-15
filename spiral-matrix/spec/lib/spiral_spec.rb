require 'spec_helper.rb'

describe Spiral do
  describe '#initialize' do
    before(:each) do
      @array = [[1,2,3],[4,5,6],[7,8,9]]
    end

    it 'defaults to empty array if parameter is not supplied' do
      spiral = Spiral.new
      spiral.array.should == []
    end

    it 'takes an array as a parameter' do
      spiral = Spiral.new @array
      spiral.array.should == @array
    end
  end

  describe '#spiral' do
    it 'should return input array when array is not 2d' do
      spiral = Spiral.new [1,2,3]
      spiral.spiral_array.should == [1,2,3]
    end

    it 'should return balanced array in spiral order' do
      spiral = Spiral.new [[1,2],[3,4]]
      spiral.spiral_array.should == [1,2,4,3]
    end

    it 'should return tall array in spiral order' do
      spiral = Spiral.new [[1,2],[3,4],[5,6]]
      spiral.spiral_array.should == [1,2,4,6,5,3]
    end

    it 'should return wide array in spiral order' do
      spiral = Spiral.new [[1,2,3],[4,5,6]]
      spiral.spiral_array.should == [1,2,3,6,5,4]
    end

    it 'should return very tall array in spiral order' do
      spiral = Spiral.new [[1,2,3],[4,5,6],[7,8,9],[10,11,12]]
      spiral.spiral_array.should == [1,2,3,6,9,12,11,10,7,4,5,8]
    end

    it 'should return very wide array in spiral order' do
      spiral = Spiral.new [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
      spiral.spiral_array.should == [1,2,3,4,8,12,11,10,9,5,6,7]
    end

    it 'should return giant balanced array in spiral order' do
      spiral = Spiral.new [[ 1, 2, 3, 4, 5],
                           [ 6, 7, 8, 9,10],
                           [11,12,13,14,15],
                           [16,17,18,19,20],
                           [21,22,23,24,25]]
      spiral.spiral_array.should == [ 1, 2, 3, 4, 5,
                                     10,15,20,25,24,
                                     23,22,21,16,11,
                                      6, 7, 8, 9,14,
                                     19,18,17,12,13]
    end
  end
end
