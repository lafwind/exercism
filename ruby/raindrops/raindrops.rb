class Raindrops
  def self.convert(num)
    rst = ""

    rst += "Pling" if num % 3 == 0
    rst += "Plang" if num % 5 == 0
    rst += "Plong" if num % 7 == 0

    rst.empty? ? num.to_s : rst
  end
end
