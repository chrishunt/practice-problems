# Given N, print the first N Fibonacci numbers

# not relavant, but interesting. Prints nth fib number
def fib(n)
  if n < 0
    return 0
  elsif n == 0 || n == 1
    return n
  else
    return fib(n-1) + fib(n-2)
  end
end

# retuns full fib sequence of n values
def fib_sequence(n, i=0, values=[])
  if i < 0
    return nil
  elsif i < n
    if i == 0 || i == 1
      values << i
    else
      values << values[i-1] + values[i-2]
    end
    fib_sequence(n, i+1, values)
  end
  return values
end

puts fib_sequence(6)
