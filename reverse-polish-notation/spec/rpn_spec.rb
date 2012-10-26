require 'rpn'

describe Rpn, '#evaluate' do
  it 'returns the correct result with addition' do
    Rpn.evaluate([2, 3, '+']).should == 5
  end

  it 'returns the correct result with subtraction' do
    Rpn.evaluate([5, 1, '-']).should == 4
  end

  it 'returns the correct result with ABS' do
    Rpn.evaluate([-1, 'ABS']).should == 1
  end

  it 'returns the correct result with SQRT' do
    Rpn.evaluate([5, 5, '*', 'SQRT']).should == 5
  end

  it 'returns the correct result with multiplication' do
    Rpn.evaluate([5, 2, '*']).should == 10
  end

  it 'returns the correct result with division' do
    Rpn.evaluate([12, 3, '/']).should == 4
  end

  it 'returns the correct result with three operations' do
    Rpn.evaluate([12, 3, 2, '*', 8, '+', '-']).should == -2
  end

  it 'returns the correct result with four operations' do
    Rpn.evaluate([12, 3, '/', -1, '*', 'ABS', 2, '+']).should == 6
  end
end
