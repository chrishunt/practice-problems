require 'rpn'

describe Rpn, '#calculate' do
  it 'returns the correct result with addition' do
    Rpn.calculate(['2', '3', '+']).should == 5
  end

  it 'returns the correct result with subtraction' do
    Rpn.calculate(['5', '1', '-']).should == 4
  end

  it 'returns the correct result with multiplication' do
    Rpn.calculate(['5', '2', '*']).should == 10
  end

  it 'returns the correct result with division' do
    Rpn.calculate(['12', '3', '/']).should == 4
  end

  it 'returns the correct result with two operations' do
    Rpn.calculate(['12', '3', '/', '2', '+']).should == 6
  end

  it 'returns the correct result with three operations' do
    Rpn.calculate(['12', '3', '2', '*', '8', '+', '-']).should == -2
  end
end
