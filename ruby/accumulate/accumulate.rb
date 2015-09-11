class Array
  def accumulate
    raise ArgumentError unless block_given?
    self.map { |e| yield(e) }
  end
end
