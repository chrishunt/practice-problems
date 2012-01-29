require 'string_utils.rb'

describe StringUtils, '#min_match' do
  it 'returns nil when characters are nil' do
    text  = 'Hello World'
    chars = nil
    StringUtils.min_match(text, chars).should == nil
  end

  it 'returns nil when text is nil' do
    text  = nil
    chars = 'a'
    StringUtils.min_match(text, chars).should == nil
  end

  it 'returns nil when characters cannot be found in text' do
    text  = 'Hello World'
    chars = 'ab'
    StringUtils.min_match(text, chars).should == nil
  end

  it 'returns chars string when there is an exact match' do
    text  = 'Hello World'
    chars = 'orl'
    StringUtils.min_match(text, chars).should == 'orl'
  end

  it 'returns shortest match when there is a single non-exact match' do
    text  = 'Hello World'
    chars = 'eoo'
    StringUtils.min_match(text, chars).should == 'ello Wo'
  end

  it 'returns shortest match when there are multiple non-exact matches' do
    text  = 'bab acbbc abbc'
    chars = 'abc'
    StringUtils.min_match(text, chars).should == 'abbc'
  end
end
