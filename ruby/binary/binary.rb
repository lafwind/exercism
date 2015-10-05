class Binary
  VERSION = 2

  def initialize(str)
    raise ArgumentError unless str.match(/^[0|1]+$/)
    @str = str
  end

  def to_decimal
    @str.chars.reverse.map.with_index do |ele, idx|
      ele.to_i * 2**idx
    end.reduce(:+)
  end
end
