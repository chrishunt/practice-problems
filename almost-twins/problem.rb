# Given a binary search tree and a value X, find the node with value
# immediately greater than X.

class Node
  attr_accessor :value, :left, :right

  def initialize(value=nil, left=nil, right=nil)
    @value = value
    @left  = left
    @right = right
  end
end

def find_minimum(root_node)
  return root_node if root_node.left == nil
  find_minimum(root_node.left)
end

def find_pesky_sibling(root_node, value, parents=[])
  # If we can't find the value, return nil
  if root_node == nil
    return nil
  elsif value == root_node.value
    # If we don't have a right node, return the greater parent
    if root_node.right == nil
      parents.each do |parent|
        if parent.value > value
          return parent
        end
      end
      return nil
    # Otherwise, return the minimum value in the right sub-tree
    else
      return find_minimum(root_node.right)
    end
  # If our value is less than the current node, check the left sub-tree
  elsif value < root_node.value
    find_pesky_sibling(root_node.left, value, parents << root_node)
  # If our value is more than the current node, check the right sub-tree
  else
    find_pesky_sibling(root_node.right, value, parents << root_node)
  end
end

# Build example binary tree
#         10
#       /    \
#      7     15
#    /  \   /  \
#   4    9 11  20
#       /
#      8

n8 = Node.new(8)
n9 = Node.new(9, n8, nil)
n4 = Node.new(4)
n7 = Node.new(7, n4, n9)
n20 = Node.new(20)
n11 = Node.new(11)
n15 = Node.new(15, n11, n20)
root_node = n10 = Node.new(10, n7, n15)

# Find solution
puts find_pesky_sibling(root_node, 9).inspect
