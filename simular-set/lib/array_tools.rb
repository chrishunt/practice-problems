class ArrayTools
  def self.simular_set(one, two)
    simular, seen = [], {}
    one.each { |element| seen[element] = 1 }
    two.each { |element| simular << element if seen[element] }
    simular
  end
end
