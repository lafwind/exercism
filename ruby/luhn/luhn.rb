class Luhn

  def self.create(num)
    [*0..9].map { |ele| num * 10 + ele }.select { |rst| self.new(rst).valid? }.first
  end

  def initialize(num)
    @num = num
  end

  def addends
    @num.to_s.chars.reverse.map.with_index do |n, idx|
      if idx % 2 == 1
        tmp = n.to_i * 2
        tmp >= 10 ? tmp - 9 : tmp
      else
        n.to_i
      end
    end.reverse
  end

  def checksum
    self.addends.reduce(0, :+)
  end

  def valid?
    checksum % 10 == 0
  end
end
