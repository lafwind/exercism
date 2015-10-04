class Robot

  def random_name
    [*1..5].map do |ele|
      if ele < 3
        ele = [*'A'..'Z'].sample
      else
        ele = [*'0'..'9'].sample
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
