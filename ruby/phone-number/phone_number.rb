class PhoneNumber
  def initialize(num_str)
    @num_str = num_str
  end

  def number
    if @num_str.match(/[a-zA-Z]/)
      return '0000000000'
    end

    num = @num_str.gsub(/\D/, '').split.join
    if num.length == 10
      num
    elsif num.length == 11 && num[0, 1] == '1'
      num[1, num.size-1]
    else
      '0000000000'
    end
  end

  def area_code
    self.number[0, 3]
  end

  def to_s
    area_code = self.area_code
    second_part = self.number[3, 3]
    last_part = self.number.chars.drop(6).join
    "(#{area_code}) #{second_part}-#{last_part}"
  end
end
