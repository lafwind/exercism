class Say
  LessThan20 = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
          "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
          "seventeen", "eighteen", "nineteen"]

  Decades = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

  def initialize(number)
    raise ArgumentError if number < 0 || number >= 10 ** 12
    @number = number
  end

  def in_english
    return "zero" if @number == 0

    (how_many("billion", @number / 1000 ** 3) +
      how_many("million", @number % (1000 ** 3) / (1000 ** 2)) +
      how_many("thousand", @number % (1000 ** 2) / 1000) +
      under_1000(@number % 1000)).rstrip
  end

  def under_100(n)
    if n < 20
      Less_than_20[n]
    else
      n % 10 == 0 ? Decades[n / 10] : [Decades[n / 10], Less_than_20[n % 10]].join('-')
    end
  end

  def under_1000(n)
    how_many("hundred", n / 100) + under_100(n % 100)
  end

  def how_many(unit, n)
    if n == 0
      ""
    else
      xxx = unit == "hundred" ? 100 : 1000
      method_name = ("under_" + xxx.to_s).to_sym
      self.send(method_name, n) + " " + unit + " "
    end
  end
end
