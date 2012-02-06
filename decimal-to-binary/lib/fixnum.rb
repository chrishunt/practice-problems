class Fixnum
  def to_b
    value = self
    max_power = 0
    while value - (exponent = 2 ** max_power) > 0 do
      value -= exponent
      max_power += 1
    end

    value = self
    max_power.downto(0).inject('') do |result, i|
      if (exponent = 2 ** i) <= value
        value -= exponent
        result += '1'
      else
        result += '0'
      end
    end
  end
end
