class Node
  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left  = left
    @right = right
  end

  def find_pesky_sibling(value, current = self, parents = [])
    return if current.nil? # can't find value in tree

    if value == current.value
      if current.right.nil? # return greater parent
        parents.find { |p| p.value > value }
      else # return smallest node in right sub-tree
        current.right.find_minimum
      end
    else
      next_node = value < current.value ? current.left : current.right
      find_pesky_sibling(value, next_node, parents << current)
    end
  end

  protected

  def find_minimum
    self.left ? self.left.find_minimum : self
  end
end


