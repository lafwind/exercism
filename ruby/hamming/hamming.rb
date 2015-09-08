class Hamming
  VERSION = 1

  def self.compute(a, b)
    raise ArgumentError if a.length != b.length

    rst, tmp = 0, b.chars
    a.chars.each do |ele|
      rst += 1 if ele != tmp.shift
    end
    rst
  end
end
