module Rpn
  OPERATIONS = Hash.new do |hash, key|
    hash[key] = lambda { |l, r| l.send(key, r) }
  end.merge({
    'ABS'  => lambda { |l| l.abs },
    'SQRT' => lambda { |l| Math.sqrt(l) }
  })

  def self.evaluate(expression)
    expression.inject([]) do |stack, element|
      unless element.is_a? Fixnum
        operation = OPERATIONS[element]
        stack << operation.call(*stack.pop(operation.arity))
      else
        stack << element
      end
    end.pop
  end
end
