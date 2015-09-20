class Palindromes
  def initialize(args)
    @max_factor = args[:max_factor] ||= 9
    @min_factor = args[:min_factor] ||= 1
    @largest, @largest_factors = @min_factor ** 2, []
    @smallest, @smallest_factors = @max_factor ** 2, []
  end

  def set_est_of(op, product, est, est_factors, factor)
    if product.send(op.to_sym, est)
      est = product
      est_factors.clear << factor
    elsif product == est
      est_factors << factor
    end
    [est, est_factors]
  end

  def is_palindromes?(num)
    num - num.to_s.reverse.to_i == 0
  end

  def generate
    factors =[*@min_factor..@max_factor]
    factors.product(factors).each do |factor|
      product = factor.first * factor.last
      if is_palindromes?(product)
        @largest, @largest_factors =
                  set_est_of('>', product, @largest, @largest_factors, factor)
        @smallest, @smallest_factors =
                  set_est_of('<', product, @smallest, @smallest_factors, factor)
      end
    end
  end

  def sure_answer_of(est, factors)
    is_palindromes?(est) ? [est, factors] : [0, []]
  end

  def find_est_of(xxx)
    if xxx == "large"
      @largest_factors = @largest_factors.map { |ele| ele.sort }.uniq
      result = sure_answer_of(@largest, @largest_factors)
    elsif xxx == "small"
      @smallest_factors = @smallest_factors.map { |ele| ele.sort }.uniq
      result = sure_answer_of(@smallest, @smallest_factors)
    end

    def result.method_missing(name)
      return self.first if name == "value".to_sym
      return self.last if name == "factors".to_sym
      super
    end

    result
  end

  def largest
    find_est_of("large")
  end

  def smallest
    find_est_of("small")
  end
end
