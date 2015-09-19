class Hexadecimal
  CHARS = [*'a'..'f']

  def initialize(string)
    @string = string
  end

  def to_decimal
    return 0 if @string.downcase.gsub(/[0-9a-f]/, '').length != 0

    @string.downcase.chars.reverse.map.with_index do |value, idx|
      (CHARS.include?(value) ? CHARS.index(value) + 10 : value.to_i) * 16 ** idx
    end.reduce(0, :+)
  end
end
