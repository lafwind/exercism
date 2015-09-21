class TriangleError < StandardError
end

class Triangle
  def initialize(a, b, c)
    @triangle = [a, b, c].sort
  end

  def kind
    raise TriangleError if @triangle.first <= 0 ||
                           @triangle[0..1].reduce(0, :+) <= @triangle.last
    case @triangle.uniq.length
    when 1 then :equilateral
    when 2 then :isosceles
    else :scalene
    end
  end
end
