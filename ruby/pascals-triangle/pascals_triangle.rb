class Triangle
  def initialize(rows)
    @rows = rows
  end

  def rows
    [*1..@rows].map { |row| get_row(row, [1]) }
  end

  def get_row(n, rst)
    return rst if n == 1
    rst_a = [0].concat(rst)
    rst_b = rst.concat([0])
    rst = rst_a.zip(rst_b).map { |pair| pair.reduce(0, :+) }
    get_row(n - 1, rst)
  end
end
