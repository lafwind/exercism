class Trinary
  def initialize(str)
    @str = str
  end

  def to_decimal
    @str.chars.reverse.map.with_index do |val, idx|
      val.to_i * 3 ** idx
    end.reduce(&:+)
  end
end
