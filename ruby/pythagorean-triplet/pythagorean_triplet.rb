class Triplet

  def self.where(args)
    sum = args[:sum] || nil
    max_factor = args[:max_factor] || 10
    min_factor = args[:min_factor] || 1

    [*min_factor..max_factor].combination(3).map do |nums|
      a, b, c = nums
      self.new(a, b, c)
    end.select do |triple|
      triple.pythagorean? &&
        (sum.nil? ? true : triple.sum == sum)
    end
  end

  def initialize(a, b, c)
    @data = [a, b, c].sort
  end

  def sum
    @data.reduce(0, :+)
  end

  def product
    @data.reduce(1, :*)
  end

  def pythagorean?
    sqr = @data.map { |n| n ** 2 }
    sqr[0] + sqr[1] == sqr[2]
  end
end
