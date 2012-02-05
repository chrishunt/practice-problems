require 'palindrome'

describe String, '#palindrome?' do
  it 'returns true for racecar' do
    'racecar'.palindrome?.should == true
  end

  it 'returns true for bob' do
    'bob'.palindrome?.should == true
  end

  it 'returns true for baab' do
    'baab'.palindrome?.should == true
  end

  it 'returns true for a' do
    'a'.palindrome?.should == true
  end

  it 'returns true for an empty string' do
    ''.palindrome?.should == true
  end

  it 'returns false for ruby' do
    'ruby'.palindrome?.should == false
  end

  it 'returns false for ab' do
    'ab'.palindrome?.should == false
  end

  it 'ignores spaces' do
    'race car'.palindrome?.should == true
  end

  it 'ignores commas' do
    'race,car'.palindrome?.should == true
  end

  it 'ignores letter case' do
    'raceCar'.palindrome?.should == true
  end

  it 'works correctly with numbers' do
    '12345'.palindrome?.should == false
    '12321'.palindrome?.should == true
  end

  it 'returns true for a phrase' do
    'A man, a plan, a canal, Panama'.palindrome?.should == true
  end
end
