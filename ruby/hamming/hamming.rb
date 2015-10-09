class Hamming
  VERSION = 1

  def self.compute(a, b)
    raise ArgumentError if a.length != b.length

    a.chars.map.with_index do |ele, idx|
      ele != b.chars[idx] ? 1 : nil
    end.compact.reduce(0, &:+)
  end
end
