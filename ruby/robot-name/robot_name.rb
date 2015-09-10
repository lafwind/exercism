class Robot

  def random_name
    chars = ("A".."Z").to_a
    num = ("0".."9").to_a

    # VERSION 2
    [*1..5].map do |e|
      if e < 3
        e = chars[rand(0..chars.size-1)]
      else
        e = num[rand(0..num.size-1)]
      end
    end.join

    # VERSION 1

    # rst = ""
    # 1.upto(5) do |i|
    #   if i < 3
    #     rst << chars[rand(0..chars.size-1)]
    #   else
    #     rst << num[rand(0..num.size-1)]
    #   end
    # end
    # rst
  end

  def initialize
    @name = random_name
  end

  def name
    @name
  end

  def reset
    tmp_name = random_name
    while @name == tmp_name
      tmp_name = random_name
    end
    @name = random_name
  end
end
