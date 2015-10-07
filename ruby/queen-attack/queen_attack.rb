class Queens
  attr_reader :white, :black

  def initialize(args = {})
    @white = args[:white] || [0, 3]
    @black = args[:black] || [7, 3]
    raise ArgumentError if @white == @black
  end

  def to_s
    board = Array.new(8) {Array.new(8, '_')}
    board[@white.first][@white.last] = 'W'
    board[@black.first][@black.last] = 'B'
    board.map { |place| place.join(' ') }.join("\n")
  end

  def is_diagonal?
    (@white.first - @black.first).abs == (@white.last - @black.last).abs
  end

  def attack?
     is_diagonal? || is_same_row? || is_same_column?
  end

  def is_same_row?
    @white.first == @black.first
  end

  def is_same_column?
    @white.last == @black.last
  end
end
