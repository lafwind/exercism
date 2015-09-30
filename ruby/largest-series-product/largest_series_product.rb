class Series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
  end

  def largest_product(n)
    raise ArgumentError if n > @digits.size
    return 1 if @digits.empty?

    @digits.map.with_index do |_, idx|
      @digits[idx, n] if (idx + n) <= @digits.size
    end.compact.map { |group| group.reduce(1, :*) }.max
  end
end
