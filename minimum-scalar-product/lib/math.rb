module Math
  def self.minProduct(v1, v2)
    v1 = v1.sort
    v2 = v2.sort.reverse

    (0..v1.size-1).inject(0) { |sum, i| sum += v1[i] * v2[i] }
  end
end
