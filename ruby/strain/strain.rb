class Array
  def keep
    raise ArgumentError unless block_given?
    rst = []
    self.each { |e| rst << e if yield(e) }
    rst
  end

  def discard
    raise ArgumentError unless block_given?
    rst = []
    self.each { |e| rst << e unless yield(e) }
    rst
  end
end
