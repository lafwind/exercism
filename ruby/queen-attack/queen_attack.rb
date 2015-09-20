class Queens
  attr_reader :white, :black

  def initialize(args = { white: [0, 3], black:  [7, 3] })
    raise ArgumentError if args.values.uniq.length == 1
    @white, @black = args[:white], args[:black]
  end

  def to_s
    board = Array.new(8) {Array.new(8, '_')}
    board[@white.first][@white.last] = 'W'
    board[@black.first][@black.last] = 'B'
    board.map { |place| place.join(' ') }.join("\n")
  end

  def attack?
    (@white.first - @black.first).abs == (@white.last - @black.last).abs ||
      @white.first == @black.first ||
      @white.last == @black.last
  end
end
