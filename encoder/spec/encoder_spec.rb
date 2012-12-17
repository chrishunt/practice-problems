require 'encoder'

describe Encoder do
  shared_examples_for 'a probably encoded string set' do
    it 'encodes and decodes properly' do
      subject.decode( subject.encode(strings) ).should == strings
    end
  end

  describe 'with a normal string array' do
    let(:strings) { ['a,b', 'ab', 'ab/@1c', 'a@21q'] }
    it_should_behave_like 'a probably encoded string set'
  end

  describe 'with an empty string' do
    let(:strings) { ['a', '', 'b'] }
    it_should_behave_like 'a probably encoded string set'
  end

  describe 'with a nil string' do
    let(:strings) { ['a', nil, 'b'] }
    it_should_behave_like 'a probably encoded string set'
  end
end
