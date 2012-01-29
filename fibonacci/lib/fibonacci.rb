class Fibonacci
  def self.sequence(n = 0, i = 0, result = [])
    if i < n
      value = i <= 1 ? i : result[i-1] + result[i-2]
      result << value
      sequence(n, i + 1, result)
    end
    result
  end

  def self.get(n)
    n <= 1 ? n : get(n-1) + get(n-2)
  end
end
