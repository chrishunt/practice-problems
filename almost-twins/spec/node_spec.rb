require 'node.rb'

describe Node do
  describe '#initialize' do
    it 'accepts three parameters' do
      Node.new(1, 2, 3).should_not == nil
    end

    it 'saves three parameters' do
      node = Node.new(value = 5, left = 6, right = 7)
      node.value.should == value
      node.left.should  == left
      node.right.should == right
    end
  end

  describe '#find_pesky_sibling' do
    subject { get_tree }

    it 'returns nil when value cannot be found' do
      subject.find_pesky_sibling(21).should == nil
    end

    it 'returns nil when elder sibling cannot be found' do
      subject.find_pesky_sibling(20).should == nil
    end

    it 'returns parent when appropriate' do
      subject.find_pesky_sibling(11).value.should == 15
    end

    it 'returns child when appropriate' do
      subject.find_pesky_sibling(15).value.should == 20
    end

    it 'returns grandchild when appropriate' do
      subject.find_pesky_sibling(7).value.should == 8
    end

    it 'returns grandparent when appropriate' do
      subject.find_pesky_sibling(9).value.should == 10
    end
  end

  describe '#find_minimum' do
    subject { get_tree }

    it 'returns self if there is no left node' do
      n4 = subject.left.left
      n4.send(:find_minimum).should == n4
    end

    it 'returns the left-most node in the tree' do
      subject.send(:find_minimum).value.should == 4
    end
  end

  # Build example binary tree
  #
  #         10
  #       /    \
  #      7     15
  #    /  \   /  \
  #   4    9 11  20
  #       /
  #      8
  def get_tree
    n8  = Node.new(8)
    n9  = Node.new(9, n8, nil)
    n4  = Node.new(4)
    n7  = Node.new(7, n4, n9)
    n20 = Node.new(20)
    n11 = Node.new(11)
    n15 = Node.new(15, n11, n20)
    n10 = Node.new(10, n7, n15)
  end
end
