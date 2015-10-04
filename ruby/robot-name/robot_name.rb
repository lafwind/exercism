class Robot

  def random_name
    chars = ("A".."Z").to_a
    nums = ("0".."9").to_a

    [*1..5].map do |ele|
      if ele < 3
        ele = chars[rand(0..chars.size-1)]
      else
        ele = nums[rand(0..nums.size-1)]
      end
    end.join
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
