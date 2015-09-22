class SecretHandshake

  MapTable = ["wink", "double blink", "close your eyes", "jump", nil]

  def initialize(num)
    @num = num
  end

  def commands
    return [] if !@num.is_a?(Fixnum) || @num > 31

    num_array = @num.to_s(2).rjust(5, '0').chars.reverse
    rst = num_array.map.with_index do |ele, idx|
      ele == "1" ? MapTable[idx] : nil
    end.compact

    num_array.last == "1" ? rst.reverse : rst
  end
end
