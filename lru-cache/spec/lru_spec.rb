require 'lru'

describe LRUCache do
  let(:size) { 3 }

  subject { LRUCache.new(size) }

  it 'can be created with a size' do
    subject.size.should == size
  end

  it 'can get and set keys' do
    subject.set('a', 1)
    subject.get('a').should == 1
  end

  it 'limits the number of keys to the size of the cache' do
    subject.set('a', 1)
    subject.set('b', 2)
    subject.set('c', 3)
    subject.set('d', 4)

    subject.get('a').should == nil
    subject.get('d').should == 4
  end

  it 'prioritizes keys based on access time' do
    subject.set('a', 1)
    subject.set('b', 2)
    subject.set('c', 3)
    subject.get('a')
    subject.set('d', 4)

    subject.get('a').should == 1
    subject.get('b').should == nil
  end
end
