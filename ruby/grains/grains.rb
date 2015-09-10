class Grains
  def self.square(n)
    2 ** (n - 1)
  end

  def self.total
    (0..63).map { |e| 2 ** e }.reduce(:+)
  end
end
