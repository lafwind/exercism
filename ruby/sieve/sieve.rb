class Sieve
  def initialize(n)
    @n = n
  end

  def primes
    rst, tmp =[], [*2..@n]
    while !tmp.empty?
      rst << p = tmp.shift
      tmp = tmp.select { |e| e % p != 0 }
    end
    rst
  end
end
