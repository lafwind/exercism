class PrimeFactors

  def self.for(num)
    rst = []
    while num != 1
      i = 2
      while num % i != 0
        i += 1
      end
      rst << i
      num /= i
    end
    rst
  end
end
