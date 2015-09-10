class Prime
  def self.nth(n)
    raise ArgumentError if n == 0

    i, tmp = 2, 0
    while tmp != n
      tmp += 1 if is_prime?(i)
      i += 1
    end
    i - 1
  end

  def self.is_prime?(num)
    n = 2
    while n <= Math.sqrt(num)
      return false if num % n == 0
      n += 1
    end
    true
  end
end
