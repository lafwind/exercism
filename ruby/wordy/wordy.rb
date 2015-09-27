class WordProblem
  OpStrs = ["plus", "minus", "multiplied", "divided"]
  Ops = [:+, :-, :*, :/]

  def initialize(problem)
    @problem = problem
    validate
  end

  def validate
    raise ArgumentError if @problem.gsub(/\D/, ' ').split.length < 2
  end

  def answer
    problem_array = format # eg. [1, :+, 1]

    first = problem_array.shift # eg. 1

    problem_array.group_by.with_index do |_, idx|
      idx / 2
    end.values.inject(first) do |rst, ele|
      rst.send(ele.first, ele.last)
    end
  end

  def format
    @problem.split.map do |ele|
      if ele =~ /\d/
        ele.to_i
      elsif OpStrs.include?(ele)
        Ops[OpStrs.index(ele)]
      end
    end.compact
  end
end
