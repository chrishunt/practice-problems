require 'spec_helper'

describe 'Primes' do
  describe '#upto' do
    it 'returns [] when called with no parameters' do
      Primes.upto.should == []
    end

    it 'returns [] when called with -1' do
      Primes.upto(-1).should == []
    end

    it 'returns [] when called with 0' do
      Primes.upto(0).should == []
    end

    it 'returns [1] when called with 1' do
      Primes.upto(1).should == [1]
    end

    it 'returns [1, 2] when called with 2' do
      Primes.upto(2).should == [1, 2]
    end

    it 'returns [1, 2, 3, 5] when called with 5' do
      Primes.upto(5).should == [1, 2, 3, 5]
    end

    it 'returns correctly when called with 20' do
      Primes.upto(20).should == [1, 2, 3, 5, 7, 11, 13, 17, 19]
    end
  end
end
