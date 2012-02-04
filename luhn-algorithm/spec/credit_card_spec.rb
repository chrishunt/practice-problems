require 'credit_card'

describe CreditCard, '.luhn?' do
  it 'returns true with 42' do
    CreditCard.luhn?('42').should == true
  end

  it 'returns true with 0075' do
    CreditCard.luhn?('0075').should == true
  end

  it 'returns true with 9001' do
    CreditCard.luhn?('9001').should == true
  end

  it 'returns true with 90014275' do
    CreditCard.luhn?('90014275').should == true
  end

  it 'returns false with 43' do
    CreditCard.luhn?('43').should == false
  end

  it 'returns false with 0175' do
    CreditCard.luhn?('0175').should == false
  end

  it 'returns false with 9011' do
    CreditCard.luhn?('9011').should == false
  end

  it 'returns false with 90314275' do
    CreditCard.luhn?('90314275').should == false
  end
end
