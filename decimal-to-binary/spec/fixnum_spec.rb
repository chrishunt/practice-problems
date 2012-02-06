require 'fixnum.rb'

describe Fixnum, '#to_b' do
  it 'returns correct binary string for 0' do
    0.to_b.should == '0'
  end

  it 'returns correct binary string for 1' do
    1.to_b.should == '1'
  end

  it 'returns correct binary string for 2' do
    2.to_b.should == '10'
  end

  it 'returns correct binary string for 3' do
    3.to_b.should == '11'
  end

  it 'returns correct binary string for 4' do
    4.to_b.should == '100'
  end

  it 'returns correct binary string for 5' do
    5.to_b.should == '101'
  end

  it 'returns correct binary string for 6' do
    6.to_b.should == '110'
  end

  it 'returns correct binary string for 7' do
    7.to_b.should == '111'
  end

  it 'returns correct binary string for 9' do
    9.to_b.should == '1001'
  end

  it 'returns correct binary string for 20' do
    20.to_b.should == '10100'
  end

  it 'returns correct binary string for 28' do
    28.to_b.should == '11100'
  end

  it 'returns correct binary string for 101' do
    101.to_b.should == '1100101'
  end

  it 'returns correct binary string for 101' do
    6021.to_b.should == '1011110000101'
  end
end
