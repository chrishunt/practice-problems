module Rpn
 OPS = %w(+ - * /)

 def self.calculate(ops)
   stack = []

   ops.each do |o|
     if OPS.include?(o)
       second = stack.pop.to_i
       first  = stack.pop.to_i
       stack << first.send(o, second)
     else
       stack << o
     end
   end

   stack.pop
 end
end
