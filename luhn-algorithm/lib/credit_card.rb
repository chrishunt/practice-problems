class CreditCard
  def self.luhn?(number)
    num_a  = number.reverse.split('').map { |n| n.to_i }
    sum_a  = [0, 2, 4, 6, 8, 1, 3, 5, 7, 9]
    result = 0

    num_a.each_with_index do |num, i|
      result += i % 2 == 0 ? num : sum_a[num]
    end

    result % 10 == 0
  end
end
