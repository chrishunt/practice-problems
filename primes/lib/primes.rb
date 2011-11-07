class Primes
  def self.upto(n = 0)
    return [] if n < 1

    primes = []
    (2..n).each do |n|
      is_prime = true
      primes.each do |p|
        is_prime = false if n % p == 0
      end
      primes << n if is_prime
    end

    [1] + primes
  end
end
