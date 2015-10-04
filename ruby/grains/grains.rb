class Grains
  def self.square(n)
    2 ** (n - 1)
  end

  def self.total
    chessboard = (1..64)
    chessboard.map { |ele| square(ele) }.reduce(:+)
  end
end
