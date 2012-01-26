require 'array_tools.rb'

describe ArrayTools, '#similar_set' do
  subject { ArrayTools.similar_set(one, two) }

  context 'when there are no matches' do
    let(:one)    { [1, 2, 3] }
    let(:two)    { [4, 5, 5] }

    it 'returns an empty set' do
      subject.should == []
    end
  end

  context 'when there is a single match' do
    let(:one)    { [1, 2, 3] }
    let(:two)    { [3, 4, 5] }

    it 'returns the correct set' do
      subject.should == [3]
    end
  end

  context 'when there are multiple matches' do
    let(:one)    { [1, 2, 3] }
    let(:two)    { [2, 3, 4] }

    it 'returns the correct set' do
      subject.should == [2, 3]
    end
  end

  context 'when there are are letters' do
    let(:one)    { ['a', 2, 3] }
    let(:two)    { [2, 'a', 4] }

    it 'returns the correct set' do
      subject.should == [2, 'a']
    end
  end
end
