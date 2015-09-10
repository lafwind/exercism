class Fixnum
  def to_roman
    roman = [
      ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
      ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
      ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
      ["", "M", "MM", "MMM"]
    ]

    ret, index = "", 0
    num = self
    while (num > 0)
      tmp  = num % 10
      ret = roman[index][tmp] + ret
      num, index = num / 10, index + 1
    end

    ret
  end
end
