require 'fibonacci.rb'

describe Fibonacci do
  describe '#sequence' do
    it 'returns empty set with no parameters' do
      Fibonacci.sequence.should == []
    end

    it 'returns empty set for n = 0' do
      Fibonacci.sequence(0).should == []
    end

    it 'returns empty set with n = -1' do
      Fibonacci.sequence(-1).should == []
    end

    it 'returns correct result for n = 1' do
      Fibonacci.sequence(1).should == [0]
    end

    it 'returns correct result for n = 2' do
      Fibonacci.sequence(2).should == [0, 1]
    end

    it 'returns correct result for n = 3' do
      Fibonacci.sequence(3).should == [0, 1, 1]
    end

    it 'returns correct result for n = 4' do
      Fibonacci.sequence(4).should == [0, 1, 1, 2]
    end

    it 'returns correct result for n = 10' do
      Fibonacci.sequence(10).should == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    end
  end

  describe '#get' do
    it 'returns -1 with n = -1' do
      Fibonacci.get(-1).should == -1
    end

    it 'returns zero with n = 0' do
      Fibonacci.get(0).should == 0
    end

    it 'returns correct result for n = 1' do
      Fibonacci.get(1).should == 1
    end

    it 'returns correct result for n = 2' do
      Fibonacci.get(2).should == 1
    end

    it 'returns correct result for n = 3' do
      Fibonacci.get(3).should == 2
    end

    it 'returns correct result for n = 4' do
      Fibonacci.get(4).should == 3
    end

    it 'returns correct result for n = 10' do
      Fibonacci.get(10).should == 55
    end
  end
end
